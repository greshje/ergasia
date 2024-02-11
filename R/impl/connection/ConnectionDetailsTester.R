# ---
#
# A method to test connection details
#
# ---

# imports
source("./R/impl/database/ErgDbUtil.R")

ConnectionDetailsTester = {}

ConnectionDetailsTester$testConnection = function(connectionDetails, dbms) {
  print(paste0("DBMS is: ", dbms))
  conn <- DatabaseConnector::connect(connectionDetails)
  sqlString <- "select 1 as one"
  success <- ErgDbUtil$query(sqlString, dbms, conn)
  print(success)
  DatabaseConnector::disconnect(conn)
  if (success != 1) {
    stop("We were not able to create the database connection for the given connectionDetails.")
  } else {
    print("CONNECTION TEST PASSED")
  }
}
