# ---
# 
# A script to install the correct version of Strategus used by this project.  
#
# ---

# set the library path
source("./R/impl/lib/SetLibPaths.R")
SetLibPaths$exec()

# libraries
library(theon)
library(devtools)
library(R6)

# get the theon library utilities
libUtil <- getTheon()

# get the current version of theon
writeLines(paste0("Using theon version: ", libUtil$getPackageVersion("theon")))

# package to install
remName <- "Strategus"
pkgName <- "OHDSI/Strategus"
pkgVersion <- "v0.1.0"

# remove 
libUtil$forceRemovePackage(remName)

# install
libUtil$installFromGithub(pkgName, pkgVersion)

# check the libPaths
.libPaths()
