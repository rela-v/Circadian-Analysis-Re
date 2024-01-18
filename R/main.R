print("main.R: Starting...")

print("main.R: Installing/verifying packages...")
# Package names
packages <- c("minpack.lm", "snowfall", "doParallel", "lme4", "BiocManager", "qvalue")
# Install packages that aren't already there
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  BiocManager::install("qvalue")
}
print("main.R: Loading packages...")
# Load packages
invisible(lapply(packages, library, character.only = TRUE))
print("main.R: Initializing External Functions...")
source("./R/fitSinCurve.R")
source("./R/Curve_Drawing.R")
source("./R/bestModelSelection.R")
print("main.R: Running RhythmicityCode.R...")
source("./R/RhythmicityCode.R")
print("main.R: Running ./R/DE.R...")
source("./R/DE.R")
print("main.R: Routine Complete.\nSee Results in the `./Results/` folder.")
