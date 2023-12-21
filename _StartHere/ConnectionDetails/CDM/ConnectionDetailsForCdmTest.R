# ---
#
# Run this script to test the connection details for the cdm connection.  
#
# ---

source("./R/impl/connection/ConnectionDetailsFactory.R")
source("./R/impl/connection/ConnectionDetailsTester.R")

connectionDetails <- ConnectionDetailsFactory$getCdmConnectionDetails()
ConnectionDetailsTester$testConnection(connectionDetails)

