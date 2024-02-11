# imports
source("./R/impl/configuration/ConfigurationFactory.R")
source("./_StartHere/ConnectionDetails/CDM/ConnectionDetailsForCdm.R")
source("./R/impl/database/ErgDbUtil.R")

# function used to echo what table is being dropped/recreated
echoStatus <- function(tableName) {
  msg <- ""
  msg <- paste0(msg, "\n# ---")
  msg <- paste0(msg, "\n#")
  msg <- paste0(msg, "\n# RECREATING TABLE: ", tableName)
  msg <- paste0(msg, "\n#")
  msg <- paste0(msg, "\n# ---")
  msg <- paste0(msg, "\n")
  writeLines(msg)
}

# function to drop and recreate a table
dropAndRecreateTable <- function (tableName) {
  echoStatus(tableName)
  ErgDbUtil$exec(paste0("drop schema if exists ", tableName, " cascade"), dbms, conn)
  ErgDbUtil$exec(paste0("create schema ", tableName), dbms, conn)
  writeLines(paste0("Done recreating table: ", tableName, ""))
}

# get the configuration and dbms for the cdm
config <- ConfigurationFactory$getConfiguration()
dbms <- config$dbms

# get the connection
connectionDetails <- ConnectionDetailsForCdm$get()
conn <- DatabaseConnector::connect(connectionDetails)

# test the connection
success <- ErgDbUtil$query("select 1 as one", dbms, conn)
print(success)

# reset the working tables
dropAndRecreateTable(config$workSchema)
dropAndRecreateTable(config$tempSchema)

# done
writeLines("\n\n\n")
writeLines("Done.")




