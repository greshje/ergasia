# ---
#
# A script to load libraries used by Strategus.  
#
# ---

# set the library path
source("./R/impl/lib/SetLibPaths.R")
SetLibPaths$exec()

library(theon)

# get libUtils and echo version of theon
libUtil <- theon::getTheon()
libUtil$getPackageVersion("theon")

# ---
#
# function to add a lib from cran
#
# ---

addLibFromCran <- function(remName, pkgName, pkgVersion) {
  # crete libUtil instance
  libUtil <- theon::getTheon()
  # see what version is currently installed
  print(libUtil$getPackageVersion(pkgName))
  # remove the existing package
  libUtil$forceRemovePackage(remName)    
  # see what version is now installed
  print(libUtil$getPackageVersion(pkgName))
  # add the correct version
  libUtil$installFromCran(pkgName, pkgVersion)
  # see what version is now installed
  print(libUtil$getPackageVersion(pkgName))
}

# ---
#
# function to add a lib from github
#
# ---

addLibFromGitHub <- function(remName, pkgName, pkgVersion) {
  # crete libUtil instance
  libUtil <- theon::getTheon()
  # see what version is currently installed
  print(libUtil$getPackageVersion(pkgName))
  # remove the existing package
  libUtil$forceRemovePackage(remName)    
  # see what version is now installed
  print(libUtil$getPackageVersion(pkgName))
  # add the correct version
  libUtil$installFromGithub(pkgName, pkgVersion)
  # see what version is now installed
  print(libUtil$getPackageVersion(pkgName))
}

# ---
#
# install packages
#
# ---

# installs from cran
addLibFromCran("remotes", "remotes", "2.4.2.1")
addLibFromCran("keyring", "keyring", "1.3.1")
addLibFromCran("usethis", "usethis", "2.2.2")
addLibFromCran("dplyr", "dplyr", "1.1.4")
addLibFromCran("R6", "R6", "2.5.1")
addLibFromCran("DatabaseConnector", "DatabaseConnector", "6.2.4")

# installs from github
addLibFromGitHub("Strategus", "OHDSI/Strategus", "v0.1.0")
addLibFromGitHub("CohortGenerator", "OHDSI/CohortGenerator", "v0.8.1")
addLibFromGitHub("CohortMethod", "OHDSI/CohortMethod", "v5.1.0")
addLibFromGitHub("CohortIncidence", "OHDSI/CohortIncidence", "v3.2.0")
addLibFromGitHub("CohortDiagnostics", "OHDSI/CohortDiagnostics", "main")
addLibFromGitHub("CirceR", "OHDSI/CirceR", "v1.3.1")

# done
writeLines("Done.")

# check the libPaths
.libPaths()




