# ---
#
# A method to test connection details
#
# ---

ConnectionDetailsTester = {}

ConnectionDetailsTester$testConnection = function(connectionDetails) {
  conn <- DatabaseConnector::connect(connectionDetails)
  success <- DatabaseConnector::querySql(conn, "select 1 as one")
  print(success)
  DatabaseConnector::disconnect(conn)
  if (success != 1) {
    stop("We were not able to create the database connection for the given connectionDetails.")
  } else {
    print("CONNECTION TEST PASSED")
  }
}
