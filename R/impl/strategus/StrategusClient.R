# ---
#
# A class to run strategus studies
#
# ---

# libraries
library(R6)
library(Strategus)

# includes
source("./R/impl/configuration/ConfigurationFactory.R")
source("./R/impl/executionsettings/ExecutionSettings.R")
source("./R/impl/connectioncache/ConnectionCacheUtil.R")
source("./R/impl/connection/ConnectionDetailsFactory.R")

StrategusClient = R6Class (
  
  classname = "StrategusClient",
  
  public = list ()

)

# ---
#
# static functions
#
# ---

StrategusClient$copyResults <- function(analysisName) {
    config <- ConfigurationFactory$getConfiguration()
    resultsLocation <- paste(config$outputDir, "Results", sep = "/")
    resultsDatabaseName <- config$resultsDatabaseName
    resultsDir <- file.path(resultsLocation, analysisName, resultsDatabaseName)
    if (dir.exists(resultsDir)) {
      unlink(resultsDir, recursive = TRUE)
    }
    dir.create(file.path(resultsDir), recursive = TRUE)
    srcDir <- paste(config$outputDir, config$resultsDatabaseName, "strategusOutput", sep = "/")
    dstDir <- resultsDir
    file.copy(srcDir, dstDir, recursive = TRUE)
}

StrategusClient$runStudy <- function(analysisFile, analysisName) {
  # get the configuration
  config <- ConfigurationFactory$getConfiguration()
  # load the json specification for the study
  analysisSpecifications <- ParallelLogger::loadSettingsFromJson(fileName = analysisFile)
  # create the execution settings
  executionSettings <- ExecutionSettings$new()$createExecutionSettings()
  # create and store the connection details
  ConnectionCacheUtil$createAndStoreCdmConnectionDetails()
  # execute stratagus
  Strategus::execute (
    analysisSpecifications = analysisSpecifications,
    executionSettings = executionSettings,
    executionScriptFolder = file.path(config$outputDir, config$resultsDatabaseName, "strategusExecution"),
    keyringName = config$keyringName
  )
  # copy over the results
  StrategusClient$copyResults(analysisName)
}

  