library(testthat)
library(R6)

test_that(
  "LibraryUtilities returns OhdsiLibUtil instance",
  {
    scriptDir <- getScriptDir()
    rootDir <- file.path(scriptDir, "..")
    rootDir
    setwd(rootDir)
    getwd()
    source("./R/LibraryUtilities.R")
    writeLines(getwd())
    expect_true(1 == 1)
    libUtil <- getNewOhdsiLibUtil()
    libUtil$test()
  }
)
