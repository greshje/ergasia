# ---
#
# A script to load libraries used by Strategus.  
#
# ---

library(theon)

# imports
source("./R/impl/configuration/ConfigurationFactory.R")
config <- ConfigurationFactory$getConfiguration()
libPath <- config$libPath
theon <- theon::getTheon()

# ---
#
# function to add a lib from cran
#
# ---

addLibFromCran <- function(remName, pkgName, pkgVersion) {
  # remove the existing package
  theon$forceRemovePackage(remName)    
  theon$removeForeign(remName, libPath)
  # add the correct version
  theon$installFromCran(pkgName, pkgVersion)
  theon$installFromCran(pkgName, pkgVersion, libPath)
}

# ---
#
# add packages from cran
#
# ---

addLibFromCran <- function(remName, pkgName, pkgVersion) {
  theon$installFromCran(pkgName, pkgVersion)
}

# installs from cran
addLibFromCran("remotes", "remotes", "2.4.2.1")
addLibFromCran("keyring", "keyring", "1.3.1")
addLibFromCran("usethis", "usethis", "2.2.2")
addLibFromCran("dplyr", "dplyr", "1.1.4")
addLibFromCran("R6", "R6", "2.5.1")
addLibFromCran("DatabaseConnector", "DatabaseConnector", "6.2.4")

# ---
#
# add packages from cran
#
# ---

addLibFromCran <- function(remName, pkgName, pkgVersion) {
  theon$installFromGithub(pkgName, pkgVersion)
}





