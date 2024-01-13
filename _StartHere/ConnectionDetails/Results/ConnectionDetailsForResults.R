# ---
# 
# ConnectionDetailsFactoryForResults.R
# This script creates the DatabaseConnector connectionDetails objects used for reporting results. 
# Use this code as is or substitute with your own. 
#
# ---

ConnectionDetailsForResults <- {}

ConnectionDetailsForResults$createConnectionDetails <- function() {
  resultsDatabaseConnectionDetails <- DatabaseConnector::createConnectionDetails(
    dbms = "postgresql",
    connectionString = "jdbc:postgresql://localhost:5432/STRAT_RESULTS?user=postgres&password=ohdsi&currentSchema=STRAT_RESULTS",
    pathToDriver = "D:/_YES/databases/postgres/drivers/42.3.3"
  )
  return(resultsDatabaseConnectionDetails)
}

