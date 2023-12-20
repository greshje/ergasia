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

StrategusClient = R6Class (
  
  classname = "StrategusClient",
  
  public = list (
    
    runStudy = function(analysisFile, analysisName) {
      # get the configuration
      config <- ConfigurationFactory$new()$getConfiguration()
      # load the json specification for the study
      analysisSpecifications <- ParallelLogger::loadSettingsFromJson(fileName = analysisFile)
      executionSettings <- ExecutionSettings$new()$createExecutionSettings()
      outputLocation <- config$outputDir
      dataPartnerName <- config$dataPartnerName
      # execute stratagus
      # Strategus::execute (
      #   analysisSpecifications = analysisSpecifications,
      #   executionSettings = executionSettings,
      #   executionScriptFolder = file.path(outputLocation, dataPartnerName, "strategusExecution"),
      #   keyringName = StrategusRunnerUtil$keyringName
      # )
    }
    
  )
  
)