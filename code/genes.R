npr <- c(
  "Adcyap1r1",
  "Avpr1a",
  "Calcr",
  "Calcrl",
  "Cckar",
  "Cckbr",
  "Cntfr",
  "Crhr1",
  "Crhr2",
  "Esr1",
  "Galr1",
  "Galr2",
  "Galr3",
  "Ghr",
  "Ghrhr",
  "Ghsr",
  "Glp1r",
  "Gpr55",
  "Gpr83",
  "Gpr149",
  "Grpr",
  "Hcrtr1",
  "Hcrtr2",
  "Igf1r",
  "Insr",
  "Insrr",
  "Kiss1r",
  "Lepr",
  "Mc1r",
  "Mc3r",
  "Mc4r",
  "Mchr1",
  "Nmbr",
  "Nmur1",
  "Nmur2",
  "Npffr1",
  "Npffr2",
  "Npr1",
  "Npr2",
  "Npr3",
  "Npsr1",
  "Npsr2",
  "Npy1r",
  "Npy2r",
  "Npy5r",
  "Ntrk2",
  "Ntsr1",
  "Ntsr2",
  "Oprd1",
  "Oprk1",
  "Oprl1",
  "Oprm1",
  "Oxtr",
  "Prlhr",
  "Prlr",
  "Prokr2",
  "Qrfpr",
  "Rxfp1",
  "Rxfp2",
  "Sstr1",
  "Sstr2",
  "Sstr3",
  "Tacr1",
  "Tacr3",
  "Trhr",
  "Trhr2",
  "Tshr",
  "Vipr1",
  "Vipr2"
)

np <- c(
  "Adcyap1",
  "Agrp",
  "Avp",
  "Bdnf",
  "Cartpt",
  "Cck",
  "Cntf",
  "Crh",
  "Gal",
  "Ghrh",
  "Ghrl",
  "Grp",
  "Hcrt",
  "Kiss1",
  "Lep",
  "Nmb",
  "Nms",
  "Nmu",
  "Npvf",
  "Npw",
  "Npy",
  "Nts",
  "Oxt",
  "Pdyn",
  "Penk",
  "Pmch",
  "Pnoc",
  "Pomc",
  "Qrfp",
  "Reln",
  "Rln1",
  "Rln3",
  "Sst",
  "Tac1",
  "Tac2",
  "Trh"
)

irs_genes <- c(
  "Alk", "Insr", "Ltk", "Igf1r", "Irs1",
  "Ptn", "Mdk", "Fam150a", "Fam150b",
  "Mc4r", "Lepr", "Sim1", "Lmo4",
  "Slc2a1", "Slc2a3"
)

neurotrans <- c(
  "Slc17a6", "Slc17a7", "Slc17a8", "Slc1a1", "Slc1a2", "Slc1a6",
  "Gad1", "Slc32a1", "Slc6a1"
)
glut <- c("Slc17a6", "Slc17a7", "Slc17a8", "Slc1a1", "Slc1a2", "Slc1a6")
glutr <- c(
  "Gria1", "Gria2", "Gria3", "Gria4", # iGlu AMPA receptors
  "Grid1", "Grid2", # iGlu delta receptors
  "Grik1", "Grik2", "Grik3", "Grik4", "Grik5", # iGlu kainate receptors
  "Grin1", "Grin2a", "Grin2b", "Grin2c", "Grin2d", "Grin3a", "Grin3b", # iGlu NMDA receptors
  "Grm1", "Grm5", # mGluRs 1
  "Grm2", "Grm3", # mGluRs 2
  "Grm4", "Grm6", "Grm7", "Grm8" # mGluRs 3
)
gaba <- c("Gad1", "Gad2", "Slc32a1", "Slc6a1")
gabar <- c(
  "Gabra1", "Gabra2", "Gabra3", "Gabra4", "Gabra5", "Gabra6",
  "Gabrb1", "Gabrb2", "Gabrb3",
  "Gabrg1", "Gabrg2", "Gabrg3",
  "Gabrd", "Gabre", "Gabrp", "Gabrq",
  "Gabrr1", "Gabrr2", "Gabrr3",
  "Gabbr1", "Gabbr2"
)

nmr <- c(
  "Adra1a",
  "Adra1b",
  "Adra1d",
  "Adra2a",
  "Adra2b",
  "Adra2c",
  "Adrb1",
  "Adrb2",
  "Adrb3",
  "Adrbk1",
  "Adrbk2",
  "Adrm1", # adrenergic receptors
  "Adora1",
  "Adora2a",
  "Adora2b",
  "Adora3", # adenosine receptors
  "Chrm1",
  "Chrm2",
  "Chrm3",
  "Chrm4",
  "Chrm5",
  "Chrna1",
  "Chrna2",
  "Chrna3",
  "Chrna4",
  "Chrna5",
  "Chrna6",
  "Chrna7",
  "Chrna9",
  "Chrna10",
  "Chrnb1",
  "Chrnb2",
  "Chrnb3",
  "Chrnd",
  "Chrng", # cholinergic receptors
  "Gria1",
  "Gria2",
  "Gria3",
  "Gria4", # iGlu AMPA receptors
  "Grid1",
  "Grid2", # iGlu delta receptors
  "Grik1",
  "Grik2",
  "Grik3",
  "Grik4",
  "Grik5", # iGlu kainate receptors
  "Grin1",
  "Grin2a",
  "Grin2b",
  "Grin2c",
  "Grin2d",
  "Grin3a",
  "Grin3b", # iGlu NMDA receptors
  "Grm1",
  "Grm5", # mGluRs 1
  "Grm2",
  "Grm3", # mGluRs 2
  "Grm4",
  "Grm6",
  "Grm7",
  "Grm8", # mGluRs 3
  "Gabra1",
  "Gabra2",
  "Gabra3",
  "Gabra4",
  "Gabra5",
  "Gabra6",
  "Gabrb1",
  "Gabrb2",
  "Gabrb3",
  "Gabrg1",
  "Gabrg2",
  "Gabrg3",
  "Gabrd",
  "Gabre",
  "Gabrp",
  "Gabrq",
  "Gabrr1",
  "Gabrr2",
  "Gabrr3",
  "Gabbr1",
  "Gabbr2", # GABA receptors
  "Drd1",
  "Drd2",
  "Drd3",
  "Drd4",
  "Drd5", # dopamine receptors
  "Htr1a",
  "Htr1b",
  "Htr1d",
  "Htr1f",
  "Htr2a",
  "Htr2b",
  "Htr2c",
  "Htr3a",
  "Htr3b",
  "Htr4",
  "Htr5a",
  "Htr5b",
  "Htr6",
  "Htr7", # serotonin receptors
  "Gnas",
  "Gnai1",
  "Gnai2",
  "Gnai3",
  "Gnao1",
  "Gnao2",
  "Gnaq",
  "Gna11",
  "Gna12",
  "Gna13",
  "Gnal",
  "Gnasxl", # G protein alpha subunit
  "Gnb1",
  "Gnb2",
  "Gnb3",
  "Gnb4",
  "Gnb5", # G protein beta subunit
  "Gng2",
  "Gng3",
  "Gng4",
  "Gng5",
  "Gng7",
  "Gng8",
  "Gng10",
  "Gng11",
  "Gng12",
  "Gng13",
  "Gngt1",
  "Gngt2", # G protein gamma subunit
  "P2rx1",
  "P2rx2",
  "P2rx3",
  "P2rx4",
  "P2rx5",
  "P2rx6",
  "P2rx7",
  "P2ry1",
  "P2ry2",
  "P2ry4",
  "P2ry6",
  "P2ry12",
  "P2ry13",
  "P2ry14", # purinergic receptors
  "Ryr1",
  "Ryr2",
  "Ryr3" # ryanodine receptors
)

dopam <-
  c(
    "Th", "Slc6a3", "Slc18a2", "Ddc", "Slc18a3",
    "Drd1", "Drd2", "Drd3", "Drd4", "Drd5"
  )
sert <-
  c(
    "Htr1a", "Htr1b", "Htr1d", "Htr1f",
    "Htr2a", "Htr2b", "Htr2c",
    "Htr3a", "Htr3b", "Htr4",
    "Htr5a", "Htr5b", "Htr6", "Htr7",
    "Gnai1", "Gnai3", "Gnao1", "Gnaz"
  )
ach <- c("Chat", "Slc18a3", "Ache", "Slc5a7")
bh4 <- c("Gch1", "Qdpr", "Dhfr", "Pts", "Spr", "Pcbd1", "Pcbd2")
cnbn <- c(
  "Cnr1",
  "Cnr2",
  "Gpr55",
  "Dagla",
  "Daglb",
  "Mgll",
  "Faah",
  "Napepld",
  "Trpv1",
  "Gde1",
  "Pparg"
)
gene_int <-
  c(
    npr, np, irs_genes,
    neurotrans,
    glut, glutr,
    gaba, gabar,
    dopam, sert,
    ach, bh4
  ) %>%
  unique()
