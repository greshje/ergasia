# imports
source("./R/impl/reset/DeleteOutputFolder.R")
source("./R/impl/reset/ResetResultsDatabaseTables.R")

ResetErgasia <- {}

ResetErgasia$exec <- function() {
  DeleteOutputFolder$exec()
  ResetResultsDatabaseTables$exec()
}


