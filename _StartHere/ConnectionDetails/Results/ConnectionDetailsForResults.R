# ---
# 
# ConnectionDetailsFactoryForResults.R
# This script creates the DatabaseConnector connectionDetails objects used for reporting results. 
# Use this code as is or substitute with your own. 
#
# ---

# imports
source("./R/impl/configuration/ConfigurationFactory.R")

ConnectionDetailsForResults <- {}

ConnectionDetailsForResults$createConnectionDetails <- function() {

  config <- ConfigurationFactory$getConfiguration()
  currentSchema <- config$cdmSchema
  
  pathToDriver <- config$pathToDriver
  dbms <- "postgresql"
  connectionString <- "jdbc:postgresql://localhost:5432/OHDSI_NACHC_COVID_HOMELESS_2023_02_13?user=postgres&password=ohdsi"

  resultsDatabaseConnectionDetails <- DatabaseConnector::createConnectionDetails (
    pathToDriver = pathToDriver,
    dbms = dbms,
    connectionString = connectionString
  )
  return(resultsDatabaseConnectionDetails)

}
