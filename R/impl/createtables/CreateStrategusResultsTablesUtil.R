# imports
source("./R/impl/configuration/ConfigurationFactory.R")
source("./_StartHere/ConnectionDetails/Results/ConnectionDetailsForResults.R")

# libraries
library(R6)

CreateStrategusResultsTablesUtil = R6Class (
  classname = "CreateStrategusResultsTablesUtil",
  public = list (
  )
)

CreateStrategusResultsTablesUtil$exec <- function(dropExisting) {
  writeLines("")
  writeLines("")
  writeLines("")
  writeLines("# ---")
  writeLines("# ")
  writeLines("# Creating Results Tables")
  writeLines("# ")
  writeLines("# ---")
  writeLines("")
  writeLines("")
  writeLines("")
}


CreateStrategusResultsTablesUtil$exec()
