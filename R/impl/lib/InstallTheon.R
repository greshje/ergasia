# ---
#
# A bootstrap class to install theon.  
#
# ---

# libraries
library(R6)

# imports
source("./R/impl/lib/RemoveTheon.R")

InstallTheon = R6Class(
  
  classname = "InstallTheon",
  
  public = list(
    
    exec = function() {
      # current version of theon being used
      pkgName <- "NACHC-CAD/theon"
      pkgVersion <- "v1.0.1"
      # remove existing instance of theon
      remUtil <- RemoveTheon$new()
      remUtil$forceRemoveTheon()
      # install theon
      remotes::install_github(pkgName, ref=pkgVersion, upgrade = TRUE, INSTALL_opts = "--no-multiarch")
      library(theon)
    }
    
  )
  
)

