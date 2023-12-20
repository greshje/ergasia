# ---
#
# Tests for the StrategusClient class.  
#
# ---

# libraries
library(testthat)

# imporots
source("./R/impl/strategus/StrategusClient.R")

analysisFile <- "./_StartHere/Studies/Test/howoften/howoften_azza.json"
analysisName <- "azza"

test_that(
  "Our test study runs",
  {
  expect_true(1 == 1)
  client <- StrategusClient$new()
  client$runStudy(analysisFile, analysisName)
  }
)


