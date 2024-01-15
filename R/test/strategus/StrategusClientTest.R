# ---
#
# Tests for the StrategusClient class.  
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




