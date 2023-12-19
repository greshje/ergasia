# ---
# 
# A script to install the correct version of Strategus used by this project.  
#
# ---

library(theon)
library(devtools)
library(R6)

libUtil <- OhdsiLibUtil$new()
libUtil$forceRemovePackage("Strategus")
devtools::unload("Strategus")
remove.packages("Strategus")
libUtil$installFromGithub("OHDSI/Strategus", "v0.1.0")

