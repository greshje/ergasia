# ---
#
# This script will run all of the studies listed in the ./_Starthere/Configuration/configuration.json file.  
#
# ---

.libPaths()

# imports
source("./R/impl/strategus/StrategusClient.R")

analysisFile <- "./_StartHere/Studies/Test/nachc/covid_homeless.json"
analysisName <- "covid_homeless"

StrategusClient$runStudy(analysisFile, analysisName)

# check the libPaths
.libPaths()




