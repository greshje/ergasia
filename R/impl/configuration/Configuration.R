# ---
#
# A class to represent the configuration required to run a study.  
#
# ---

Configuration = R6Class(
  
  classname = "Configuration",
  
  public = list(
    keyringName = "",
    libPath = "",
    dbms = "",
    dataPartnerName = "",
    outputDir = "",
    logDir = "",
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

