# ---
#
# A script to test the connection details for the CDM.  
#
# ---

# libraries
library(testthat)

# imports
source("./R/impl/configuration/ConfigurationFactory.R")
source("./R/impl/connection/ConnectionDetailsFactory.R")

# ---
#
# tests
#
# ---

test_that (
  "Connection can be created for CDM",
  {
    expect_true(1 == 1)
    config <- ConfigurationFactory$getConfiguration()
    dbms <- config$dbms
    connectionDetails <- ConnectionDetailsFactory$getCdmConnectionDetails()
    ConnectionDetailsTester$testConnection(connectionDetails, dbms)
  }
  
)
