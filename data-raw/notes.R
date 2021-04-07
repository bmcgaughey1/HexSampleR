# notes and code for building package
#
# I ran into problems building and installing the HexSampleR package related to the vignette.
# Run devtools::install(build_vignettes = TRUE) but make sure the folder for the package isn't
# open in file explorer or a command prompt. Otherwise, the install will fail!!
library(devtools)

setwd("G:/R_Stuff/HexSampleR")
devtools::install(build_vignettes = TRUE)

# check for vignette
browseVignettes("HexSampleR")

# rebuild readme.md
devtools::build_readme()
