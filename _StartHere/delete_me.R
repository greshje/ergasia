# ---
#
# This script will run all of the studies listed in the ./_Starthere/Configuration/configuration.json file.  
#
# ---

.libPaths()

# imports
source("./R/impl/strategus/StrategusClient.R")

config <- ConfigurationFactory$getConfiguration()
studiesToRun <- config$studiesToRun


rtn <- data.frame(Name = character(), File = character(), stringsAsFactors = FALSE)

for(study in studiesToRun) {
  rtn <- rbind(empty_df, data.frame(Name = study[[2]], File = study[[1]]))
}





