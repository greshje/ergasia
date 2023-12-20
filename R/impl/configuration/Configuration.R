# ---
#
# A class to represent the configuration required to run a study.  
#
# ---

Configuration = R6Class(
  
  classname = "Configuration",
  
  public = list(
    keyRingName = "org.ohdsi.strategus.ergasia",
    libPath = "",
    dbms = "",
    dataPartnerName = "",
    outputDir = "",
    pathToDriver = "",
    cdmSchema = "",
    workSchema = "",
    tempSchema = "",
    resultsSchemaPrefix = "",
    cohortTableName = "",
    studyNameList = list(),
    resultsFilter = list(),
    databaseFilter = list(),
    minCellCount = 5,
    studiesToRun = list()
  )
  
)

