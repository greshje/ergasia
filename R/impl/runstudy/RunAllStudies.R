# imports
source("./R/impl/strategus/StrategusClient.R")

RunAllStudies <- {}

RunAllStudies$exec <- function() {
    .libPaths()

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







