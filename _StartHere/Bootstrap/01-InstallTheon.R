# ---
#
# It is best to restart R session before running this script.  
#
# This script installs the correct version of the theon library management
# utilities project.  
#
# ---

# set the library path
source("./R/impl/lib/SetLibPaths.R")
SetLibPaths$exec()

source("./R/impl/lib/InstallTheon.R")
InstallTheon$exec()

.libPaths()

