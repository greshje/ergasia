# ---
#
# A class to provide user defined configuration.  
# This implementation uses json for now.  
#
# ---

library(R6)
library(jsonlite)

source("./R/impl/configuration/Configuration.R")

ConfigurationFactory = R6Class(
  
  classname = "ConfigurationFactory",
  
  public = list(
    
    getConfiguration = function() {
      # read the data file
      fileData <- read_json("./_StartHere/Configuration/configuration.json")
      # create the dvo
      rtn = Configuration$new()
      # populate the dvo
      rtn$libPath = fileData$libPath
      rtn$dbms = fileData$dbms
      rtn$dataPartnerName = fileData$dataPartnerName
      rtn$outputDir = fileData$outputDir
      rtn$pathToDriver = fileData$pathToDriver
      rtn$cdmSchema = fileData$cdmSchema
      rtn$workSchema = fileData$workSchema
      rtn$tempSchema = fileData$tempSchema
      rtn$resultsSchemaPrefix = fileData$resultsSchemaPrefix
      rtn$cohortTableName = fileData$cohortTableName
      rtn$studyNameList = fileData$studyNameList
      rtn$resultsFilter = fileData$resultsFilter 
      rtn$databaseFilter = fileData$databaseFilter
      rtn$minCellCount = fileData$minCellCount
      rtn$studiesToRun = fileData$studiesToRun
      # return the dvo
      return(rtn)
    }
    
  )
  
)