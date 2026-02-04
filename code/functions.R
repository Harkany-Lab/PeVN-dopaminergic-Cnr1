`%>%` <- magrittr::`%>%`

#' Available RAM in kB
check_ram <- function() {
  as.numeric(system("awk '/MemFree/ {print $2}' /proc/meminfo", intern = TRUE))
}

#' Available cores
available_cores <- function(prop2use = .9) {
  max(1, floor(parallel::detectCores(logical = FALSE) * prop2use))
}

#' Get number of cores to fit RAM needs
cores4ram <- function(need) {
  max(1, min(available_cores(), floor(check_ram() / need)))
}

sort_heatmap_dimension <-
  function(srt, genes, the_gene, key = NULL, value = NULL, use_assay = "RNA") {
    stopifnot(require(Seurat))
    if (!is.null(key) && !is.null(value)) {
      temp <- Seurat::FetchData(srt, key) == value
      srt <- subset(srt, cells = attr(temp, "dimnames")[[1]][temp])
    }

    expressed_genes <- srt %>%
      Seurat::GetAssayData(assay = use_assay, layer = "data") %>%
      rowSums() %>%
      .[. > 1] %>%
      names()

    srt <- Seurat::DietSeurat(srt, features = expressed_genes)

    use_genes <- unique(genes) %>%
      .[. %in% expressed_genes]
    holder <- srt %>%
      Seurat::GetAssayData(assay = use_assay, layer = "data") %>%
      as.data.frame() %>%
      .[use_genes, ] %>%
      as.data.frame() %>%
      t()

    sorted_genes <- holder %>%
      corrr::correlate() %>%
      arrange(get(the_gene)) %>%
      .$term

    sorted_cells <- holder %>%
      as.data.frame() %>%
      rownames_to_column(var = "cname") %>%
      select(cname, rev(sorted_genes)) %>%
      arrange(!!!str_c("-", rev(sorted_genes))) %>%
      .$cname

    return(list(sorted_genes, sorted_cells))
  }

#' Save plot
save_my_plot <- function(name,
                         plt,
                         type,
                         h = 10,
                         asp = 1.618,
                         path = plots_dir,
                         format = ".pdf") {
  cowplot::save_plot(
    filename = here::here(
      path,
      stringr::str_glue(type,
        as.character(name),
        format,
        .sep = "_"
      )
    ),
    plot = plt,
    base_height = h,
    base_asp = asp,
    limitsize = FALSE
  )
}

occurence_ident <- function(srt) {
  stopifnot(require(Seurat))
  hold_idents <- rep_len("negative", ncol(srt))
  names(hold_idents) <- colnames(srt)
  hold_idents[Seurat::WhichCells(srt, expression = Th > 0)] <- "positive"
  return(hold_idents)
}

occurence_markers <- function(srt) {
  stopifnot(require(Seurat))
  if (!Seurat::Idents(srt) == srt$status) {
    srt$status <- occurence_ident(srt)
    Seurat::Idents(srt) <- srt$status
  }
  markers <- Seurat::FindAllMarkers(srt)
  return(markers)
}

matrix_corr <- function(mydata, glist) {
  stopifnot(require(magrittr))
  mydata <- tibble::as_tibble(mydata) %>% dplyr::select(!!glist)
  plot <- (ggstatsplot::ggcorrmat(
    data = mydata,
    ggcorrplot.args = list(outline.color = "black", hc.order = TRUE)
  ))
}

Store_Palette_Seurat <- function(seurat_object,
                                 palette,
                                 palette_name = "custom_palette") {
  stopifnot(requireNamespace("Seurat", quietly = TRUE))
  seurat_object@misc[[palette_name]] <- palette
  seurat_object
}

Plot_Density_Custom <- function(seurat_object,
                                features,
                                custom_palette = NULL,
                                reduction = "umap",
                                ...) {
  stopifnot(requireNamespace("Seurat", quietly = TRUE))
  stopifnot(requireNamespace("ggplot2", quietly = TRUE))
  cols <- if (is.null(custom_palette)) {
    c("grey90", "#2b83ba")
  } else {
    custom_palette
  }
  valid_features <- tryCatch({
    data <- Seurat::FetchData(seurat_object, vars = features, layer = "data")
    keep <- names(data)[vapply(data, function(x) {
      !(all(is.na(x)) || all(x == 0))
    }, logical(1))]
    keep
  }, error = function(...) character())

  if (length(valid_features) == 0) {
    return(
      ggplot2::ggplot() +
        ggplot2::theme_void() +
        ggplot2::annotate(
          "text",
          x = 0, y = 0,
          label = paste("No values for", paste(features, collapse = ", ")),
          size = 4
        )
    )
  }

  Seurat::FeaturePlot(
    object = seurat_object,
    features = valid_features,
    reduction = reduction,
    cols = cols,
    ...
  )
}

Plot_Density_Joint_Only <- function(seurat_object,
                                    features,
                                    custom_palette = NULL,
                                    reduction = "umap",
                                    ...) {
  stopifnot(requireNamespace("Seurat", quietly = TRUE))
  stopifnot(requireNamespace("ggplot2", quietly = TRUE))
  if (length(features) != 2) {
    stop("Plot_Density_Joint_Only expects exactly two features.")
  }
  cols <- if (!is.null(custom_palette) && length(custom_palette) >= 2) {
    c("grey90", custom_palette[1], custom_palette[length(custom_palette)])
  } else {
    c("grey90", "#2b83ba", "#d7191c")
  }
  valid_features <- tryCatch({
    data <- Seurat::FetchData(seurat_object, vars = features, layer = "data")
    keep <- names(data)[vapply(data, function(x) {
      !(all(is.na(x)) || all(x == 0))
    }, logical(1))]
    keep
  }, error = function(...) character())

  if (length(valid_features) != 2) {
    return(
      ggplot2::ggplot() +
        ggplot2::theme_void() +
        ggplot2::annotate(
          "text",
          x = 0, y = 0,
          label = paste("No values for", paste(features, collapse = " & ")),
          size = 4
        )
    )
  }
  Seurat::FeaturePlot(
    object = seurat_object,
    features = valid_features,
    reduction = reduction,
    blend = TRUE,
    cols = cols,
    ...
  )
}

plot_scatter_stats <- function(data, x, y, xfill = "#4e79a7", yfill = "#f28e2b") {
  stopifnot(requireNamespace("ggplot2", quietly = TRUE))
  stopifnot(requireNamespace("rlang", quietly = TRUE))
  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  df <- as.data.frame(data)

  corr <- suppressWarnings(stats::cor.test(df[[rlang::as_name(x)]],
                                           df[[rlang::as_name(y)]],
                                           method = "spearman"))
  label <- sprintf("rho = %.2f\np = %s",
                   unname(corr$estimate),
                   format.pval(corr$p.value, digits = 2))

  ggplot2::ggplot(df, ggplot2::aes(x = !!x, y = !!y)) +
    ggplot2::geom_point(color = xfill, alpha = 0.4, size = 0.7) +
    ggplot2::geom_smooth(method = "lm", se = FALSE, color = yfill, linewidth = 0.6) +
    ggplot2::annotate("text",
      x = Inf, y = Inf, hjust = 1.1, vjust = 1.1,
      label = label, size = 3.5
    ) +
    ggplot2::theme_minimal()
}

plot_grouped_pie <- function(data,
                             x,
                             y,
                             grouping.var,
                             title.text = NULL,
                             caption.text = NULL,
                             palette = NULL) {
  stopifnot(requireNamespace("ggplot2", quietly = TRUE))
  stopifnot(requireNamespace("dplyr", quietly = TRUE))
  stopifnot(requireNamespace("rlang", quietly = TRUE))

  x <- rlang::enquo(x)
  y <- rlang::enquo(y)
  group <- rlang::enquo(grouping.var)

  df <- data %>%
    dplyr::count(!!group, !!y, !!x, name = "n")

  plt <- ggplot2::ggplot(df, ggplot2::aes(x = "", y = n, fill = !!x)) +
    ggplot2::geom_col(width = 1, color = "white") +
    ggplot2::coord_polar(theta = "y") +
    ggplot2::facet_grid(rows = ggplot2::vars(!!group), cols = ggplot2::vars(!!y)) +
    ggplot2::theme_void() +
    ggplot2::theme(
      strip.text = ggplot2::element_text(size = 10),
      plot.title = ggplot2::element_text(hjust = 0.5),
      plot.caption = ggplot2::element_text(hjust = 0)
    )

  if (!is.null(palette)) {
    if (requireNamespace("ggsci", quietly = TRUE) &&
        palette == "category10_d3") {
      plt <- plt + ggplot2::scale_fill_manual(values = ggsci::pal_d3("category10")(10))
    }
  }

  if (!is.null(title.text)) {
    plt <- plt + ggplot2::ggtitle(title.text)
  }
  if (!is.null(caption.text)) {
    plt <- plt + ggplot2::labs(caption = caption.text)
  }

  plt
}
