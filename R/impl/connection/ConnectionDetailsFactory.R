# ---
#
# A class to provide connection details base on user definitions.  
#
# ---

# libraries
library(R6)

# includes
source("./R/impl/configuration/ConfigurationFactory.R")
source("./_StartHere/ConnectionDetails/CDM/ConnectionDetailsForCdm.R")
source("./R/impl/connection/ConnectionDetailsTester.R")

ConnectionDetailsFactory = R6Class(
  
  classname = "ConnectionDetailsFactory",
  
  public = list ()
  
)

ConnectionDetailsFactory$getCdmConnectionDetails <- function() {
  config <- ConfigurationFactory$getConfiguration()
  dbms <- config$dbms
  rtn <- ConnectionDetailsForCdm$get()
  ConnectionDetailsTester$testConnection(rtn, dbms)      
  return (rtn)
}


