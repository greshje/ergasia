# ---
#
# A class to provide the execution settings required for strategus.  
#
# ---

# libraries
library(R6)
library(Strategus)

# includes
source("./R/impl/configuration/ConfigurationFactory.R")

ExecutionSettings = R6Class(
  
  classname = "ExecutionSettings",
  
  public = list (
    createExecutionSettings = function() {
      config <- ConfigurationFactory$getConfiguration()
      rtn <- Strategus::createCdmExecutionSettings(
        connectionDetailsReference = config$dataPartnerName,
        workDatabaseSchema = config$workSchema,
        cdmDatabaseSchema = config$cdmSchema,
        cohortTableNames = CohortGenerator::getCohortTableNames(cohortTable = config$cohortTableName),
        workFolder = file.path(config$outputDir, config$dataPartnerName, "strategusWork"),
        resultsFolder = file.path(config$outputDir, config$dataPartnerName, "strategusOutput"),
        minCellCount = config$minCellCount
      )
    }
  )
  
)