# ---
#
# Implementation of ConnectionDetailsForCdm that returns a Databricks connection
# and uses a keyring to store secret information.  
#
# ---

ConnectionDetailsForCdm <- {}

ConnectionDetailsForCdm$get <- function() {
  resultsDatabaseConnectionDetails <- DatabaseConnector::createConnectionDetails(
    dbms = "postgresql",
    connectionString = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=mypass&currentSchema=demo_cdm",
    pathToDriver = "D:/_YES/databases/postgres/drivers/42.3.3"
  )
  return(resultsDatabaseConnectionDetails)

}

