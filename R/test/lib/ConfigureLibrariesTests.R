# ---
#
# A script to test the functionality of the ConfigureLibraries class.  
#
# ---

# libraries
library(testthat)

# imports
source("./R/impl/lib/ConfigureLibraries.R")

# imports
source("./R/impl/lib/ConfigureLibraries.R")

test_that(
  "Install theon works",
  {
    configLib <- ConfigureLibraries$new()
    configLib$installTheon()
  }
)

