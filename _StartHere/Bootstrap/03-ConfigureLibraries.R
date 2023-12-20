# ---
#
# A script to load libraries used by Strategus.  
#
# ---

library(theon)

# imports
source("./R/impl/configuration/ConfigurationFactory.R")
config <- ConfigurationFactory$new()$getConfiguration()
libPath <- config$libPath

addLib <- function(libName) {
  
}