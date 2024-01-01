# ---
#
# A class to provide user defined configuration.  
# This implementation uses json for now.  
#
# ---

library(R6)
library(jsonlite)
library(Strategus)

source("./R/impl/configuration/Configuration.R")

ConfigurationFactory = R6Class(
  
  classname = "ConfigurationFactory",
  
  public = list(
    
    initConfiguration = function() {
      # read the data file
      fileData <- read_json("./_StartHere/Configuration/configuration.json")
      # create the dvo
      rtn = Configuration$new()
      # add the options setting for the temp schema
      options(sqlRenderTempEmulationSchema = fileData$tempSchema)
      # hard coded value for the key for the keyring used by strategus
      rtn$keyringName = "org.ohdsi.strategus.ergasia"
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

ConfigurationFactory$getConfiguration <- function() {
  rtn <- ConfigurationFactory$new()$initConfiguration()
  return(rtn)
}

ConfigurationFactory$getStudiesToRun <- function() {
  config <- ConfigurationFactory$getConfiguration()
  studiesToRun <- config$studiesToRun
  rtn <- data.frame(Name = character(), File = character(), stringsAsFactors = FALSE)
  for(study in studiesToRun) {
    rtn <- rbind(studiesToRun, data.frame(Name = study[[2]], File = study[[1]]))
  }
  return(rtn)
}


