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
    executionScriptFolder = file.path(config$outputDir, config$dataPartnerName, "strategusExecution"),
    keyringName = config$keyringName
  )
}

  