# ---
#
# A class with methods to test connection details
#
# ---

library(R6)

ConnectionTester = R6Class(
  
  classname = "ConnectionTester",
  
  public = list (
    
    testConnection = function(connectionDetails) {
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

  )
  
)