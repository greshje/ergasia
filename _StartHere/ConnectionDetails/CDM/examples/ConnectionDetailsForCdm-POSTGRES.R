# ---
#
# Use this script to define the connection details to your instance of the CDM.  
#
# ---

ConnectionDetailsForCdm <- {}

ConnectionDetailsForCdm$get <- function() {
  rtn <- DatabaseConnector::createConnectionDetails(
    dbms = "postgresql",
    connectionString = "jdbc:postgresql://127.0.0.1:5432/postgres?user=postgres&password=mypass&currentSchema=demo_cdm",
    pathToDriver = "./etc/database/postgres/42.3.3"
  )
  return(rtn)
}

