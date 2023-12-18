# ---
#
# Script to test OhdsiLibUtil functionality.
#
# ---

library(R6)

source("./R/LibraryUtilities.R")
libUtil <- getNewOhdsiLibUtil()
libUtil$test()




