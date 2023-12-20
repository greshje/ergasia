# ---
# 
# A script to install the correct version of Strategus used by this project.  
#
# ---

# libraries
library(theon)
library(devtools)
library(R6)

# package to install
remName <- "Strategus"
pkgName <- "OHDSI/Strategus"
pkgVersion <- "v0.1.0"

# get the theon library utilities
theon <- getTheon()
# remove 
theon$forceRemovePackage(remName)
# install
theon$installFromGithub(pkgName, pkgVersion)
library(Strategus)


