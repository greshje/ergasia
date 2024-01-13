# imports
source("./R/impl/strategus/StrategusClient.R")

#libraries
library(Strategus)

# ---
#
# RunAllStudies
#
# ---

RunAllStudies <- {}

RunAllStudies$exec <- function() {

    config <- ConfigurationFactory$getConfiguration()
    studiesToRun <- ConfigurationFactory$getStudiesToRun()

    print(studiesToRun)

    for(i in 1:nrow(studiesToRun)) {
        studyName <- studiesToRun$Name[i]
        studyFile <- studiesToRun$File[i]
        writeLines("")
        writeLines("")
        writeLines("")
        writeLines("# ---")
        writeLines("# ")
        writeLines(paste0("# ","Running Study: ", studyName, " (", studyFile, ")."))
        writeLines("# ")
        writeLines("# ---")
        writeLines("")
        writeLines("")
        writeLines("")
        analysisFile <- studyFile
        analysisName <- studyName
        StrategusClient$runStudy(analysisFile, analysisName)
    }

}








