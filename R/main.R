# Package names
packages <- c("minpack.lm", "snowfall", "doParallel", "lme4", "BiocManager")

# Install packages that aren't already there
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  BiocManager::install("qvalue")
}

# Load packages
invisible(lapply(packages, library, character.only = TRUE))
source("./R/fitSinCurve.R")
