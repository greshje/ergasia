# ---
#
# Implementation of ConnectionDetailsForCdm that returns a Databricks connection
# and uses a keyring to store secret information.  
#
# ---

ConnectionDetailsForCdm <- {}

ConnectionDetailsForCdm$get <- function() {
  
  config <- ConfigurationFactory$getConfiguration()
  currentSchema <- config$cdmSchema
  
  pathToDriver <- config$pathToDriver
  dbms <- "postgresql"
  connectionString <- paste0("jdbc:postgresql://localhost:5432/postgres?user=postgres&password=mypass&currentSchema=", currentSchema)
  
  resultsDatabaseConnectionDetails <- DatabaseConnector::createConnectionDetails (
    pathToDriver = pathToDriver,
    dbms = dbms,
    connectionString = connectionString
  )
  return(resultsDatabaseConnectionDetails)
  
  
}

