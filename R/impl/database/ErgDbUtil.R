# imports
source("./R/impl/configuration/ConfigurationFactory.R")

# libraries
library(SqlRender)
library(DatabaseConnector)

ErgDbUtil <- {}

ErgDbUtil$query <- function(sqlString, dbms, conn) {
  sqlString <- SqlRender::translate(sqlString, dbms)
  rtn <- DatabaseConnector::querySql(conn, sqlString)
  return(rtn)
}

