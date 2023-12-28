# ---
#
# Tests for the StrategusClient class.  
#
# ---

# imporots
source("./R/impl/strategus/StrategusClient.R")

analysisFile <- "./_StartHere/Studies/Test/nachc/StrategusSpecification.json"
analysisName <- "covid_homeless"

StrategusClient$runStudy(analysisFile, analysisName)

    


