# ---
#
# Tests for the StrategusClient class.  
#
# ---

# libraries
library(testthat)

# imporots
source("./R/impl/strategus/StrategusClient.R")

analysisFile <- "./_StartHere/Studies/Test/howoften/howoften_azza.json"
analysisName <- "azza"

StrategusClient$runStudy(analysisFile, analysisName)

    

