# imports
source("./R/impl/configuration/ConfigurationFactory.R")

DeleteOutputFolder <- {}

DeleteOutputFolder$exec <- function() {
  
  # get the output dir
  config <- ConfigurationFactory$getConfiguration()
  dir <- config$outputDir
  
  # delete the output dir
  if (file.exists(dir)) {
    # delete the directory and its contents and echo status
    unlink(dir, recursive = TRUE, force = TRUE)
    cat("Directory deleted successfully.\n")
  } else {
    # echo status
    cat("Directory does not exist.\n")
  }

}

