# imports
source("./R/impl/configuration/ConfigurationFactory.R")
source("./_StartHere/ConnectionDetails/CDM/ConnectionDetailsForCdm.R")
source("./R/impl/database/ErgDbUtil.R")

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
ErgDbUtil$exec(paste0("drop database if exists ", config$workSchema), dbms, conn)
ErgDbUtil$exec(paste0("create database ", config$workSchema), dbms, conn)


