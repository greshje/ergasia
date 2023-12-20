# ---
#
# A class to provide connection details base on user definitions.  
#
# ---

# libraries
library(R6)

# includes
source("./_StartHere/ConnectionDetails/CDM/ConnectionDetailsForCdm.R")
source("./R/impl/connection/ConnectionDetailsTester.R")

ConnectionDetailsFactory = R6Class(
  
  classname = "ConnectionDetailsFactory",
  
  public = list (
    
    getCdmConnectionDetails = function() {
      rtn <- (ConnectionDetailsForCdm$get())
      ConnectionDetailsTester$new()$testConnection(rtn)      
      return (rtn)
    }
    
  )
  
)