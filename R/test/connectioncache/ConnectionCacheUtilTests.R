# ---
#
# Tests for connection cache
#
# ---

# libraries
library(testthat)

# includes
source("./R/impl/connectioncache/ConnectionCacheUtil.R")
source("./R/impl/connection/ConnectionDetailsFactory.R")

test_that(
  "Connection can be saved to cache.",
  {
    # make sure the test runs
    expect_true(1 == 1)
    # get the connection details
    connectionDetails <- ConnectionDetailsFactory$getCdmConnectionDetails()
    ConnectionCacheUtil$storeCdmConnectionDetails(connectionDetails)
  }
)