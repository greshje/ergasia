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
        connectionDetailsReference = config$resultsDatabaseName,
        workDatabaseSchema = config$workSchema,
        cdmDatabaseSchema = config$cdmSchema,
        cohortTableNames = CohortGenerator::getCohortTableNames(cohortTable = config$cohortTableName),
        workFolder = file.path(config$outputDir, config$resultsDatabaseName, "strategusWork"),
        resultsFolder = file.path(config$outputDir, config$resultsDatabaseName, "strategusOutput"),
        minCellCount = config$minCellCount
      )
    }
  )
  
)