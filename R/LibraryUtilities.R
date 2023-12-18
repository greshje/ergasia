# ---
#
# Function to expose functionality related to R libraries and packages.
#
# ---

source("./R/main/org/ohdsi/util/lib/OhdsiLibUtil.R")

getNewOhdsiLibUtil <- function() {
  rtn <- OhdsiLibUtil$new()
  return(rtn)
}

