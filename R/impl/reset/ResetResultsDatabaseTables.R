# imports
source("./R/impl/configuration/ConfigurationFactory.R")
source("./_StartHere/ConnectionDetails/Results/ConnectionDetailsForResults.R")


connectionDetails <- ConnectionDetailsForResults$createConnectionDetails()

conn <- DatabaseConnector::connect(connectionDetails)

success <- DatabaseConnector::executeSql("select 1 as one")

