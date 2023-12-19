# ---
#
# This script installs the correct version of the theon library management
# utilities project.  
#
# ---

source("./R/impl/lib/InstallTheon.R")
InstallTheon$new()$exec()
library(theon)


