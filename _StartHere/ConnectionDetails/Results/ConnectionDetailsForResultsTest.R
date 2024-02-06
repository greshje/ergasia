# ---
#
# Run this script to test the connection details for the cdm connection.  
#
# ---

source("./R/impl/connection/ConnectionDetailsFactory.R")
source("./_StartHere/ConnectionDetails/Results/ConnectionDetailsForResults.R")

connectionDetails <- ConnectionDetailsForResults$createConnectionDetails()
ConnectionDetailsTester$testConnection(connectionDetails)

