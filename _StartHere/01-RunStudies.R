# ---
#
# This script will run all of the studies listed in the ./_Starthere/Configuration/configuration.json file.  
#
# ---

source("./R/impl/runstudy/RunAllStudies.R")
RunAllStudies$exec()


