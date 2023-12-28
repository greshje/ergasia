# ---
#
# It is best to restart R session before running this script.  
#
# This script installs the correct version of the theon library management
# utilities project.  
#
# ---

source("./R/impl/lib/InstallTheon.R")
InstallTheon$new()$exec()

