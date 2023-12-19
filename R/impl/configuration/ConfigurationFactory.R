# ---
#
# A class to provide user defined configuration.  
# This implementation uses json for now.  
#
# ---

library(R6)
library(jsonlite)

ConfigurationFactory = R6Class(
  
  classname = "ConfigurationFactory",
  
  public = list(
    
    getConfiguration = function(jsonFile) {
      data <- fromJSON(file = jsonFile)
      return(data)
    }
    
  )
  
)