# ---
#
# This script will run all of the studies listed in the ./_Starthere/Configuration/configuration.json file.  
#
# ---

# import the actual code that runs the studies
source("./R/impl/runstudy/RunAllStudies.R")

# check what the current library path is 
.libPaths()

# check what module versions strategus is using
Strategus::getModuleList()

# run the studies listed in ./_StartHere/Configuration/configuration.json
RunAllStudies$exec()

# check what module versions strategus is using (again, so that we can see them after everything is done)
Strategus::getModuleList()
