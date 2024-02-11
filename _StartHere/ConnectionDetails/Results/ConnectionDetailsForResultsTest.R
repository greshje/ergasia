# ---
#
# Run this script to test the connection details for the cdm connection.  
#
# ---


source("./_StartHere/ConnectionDetails/Results/ConnectionDetailsForResults.R")
source("./R/impl/connection/ConnectionDetailsTester.R")

connectionDetails <- ConnectionDetailsForResults$createConnectionDetails()
ConnectionDetailsTester$testConnection(connectionDetails)


