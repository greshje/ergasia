# ---
#
# A script to test the connection details for the CDM.  
#
# ---

# libraries
library(testthat)

# imports
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
    connectionDetails <- ConnectionDetailsFactory$new()$getCdmConnectionDetails()
    ConnectionDetailsTester$new()$testConnection(connectionDetails)
  }
  
)
