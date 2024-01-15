# ---
#
# A bootstrap class to install theon.  
#
# ---

# imports
source("./R/impl/lib/RemoveTheon.R")

InstallTheon <- {}

InstallTheon$exec <- function() {
  # install remotes
  install.packages("remotes", INSTALL_opts = "--no-multiarch")
  # current version of theon being used
  pkgName <- "NACHC-CAD/theon"
  pkgVersion <- "v1.0.8"
  # remove existing instance of theon
  RemoveTheon$forceRemoveTheon()
  # instll R6 and devtools
  remotes::install_cran("R6", ref="2.5.1", upgrade = TRUE, INSTALL_opts = "--no-multiarch")
  remotes::install_cran("devtools", ref="2.4.5", upgrade = TRUE, INSTALL_opts = "--no-multiarch")
  # install theon
  remotes::install_github(pkgName, ref=pkgVersion, upgrade = TRUE, INSTALL_opts = "--no-multiarch")
  library(theon)
}


