# ---
# A script to show some basic version information.  
#
# ---

source("./R/impl/bootstrap/ConfigLibsUtil.R")
StrategusRunnerLibUtil$loadLibs()

# show working directory
getwd()
# show versions
R.Version()
system("java -version")
# show the module list
Strategus::getModuleList()

