# ---
#
# A script to load libraries used by Strategus.  
#
# ---

library(theon)

# imports
source("./R/impl/configuration/ConfigurationFactory.R")
config <- ConfigurationFactory$new()$getConfiguration()
lib <- config$libPath

libUtil <- OhdsiLibUtil$new()
