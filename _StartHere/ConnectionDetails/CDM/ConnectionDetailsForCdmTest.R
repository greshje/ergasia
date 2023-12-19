# ---
#
# Run this script to test the connection details for the cdm connection.  
#
# ---

source("./_StartHere/ConnectionDetails/CDM/ConnectionDetailsForCdm.R")
source("./R/impl/connection/ConnectionTester.R")

connectionDetails <- ConnectionDetailsForCdm$get()
tester <- ConnectionTester$new()
tester$testConnection(connectionDetails)

