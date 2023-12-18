# ---
#
# Function to expose functionality related to R libraries and packages.
#
# ---

getNewOhdsiLibUtil <- function() {
  source("./R/main/org/ohdsi/util/lib/OhdsiLibUtil.R")
  rtn <- OhdsiLibUtil$new()
  return(rtn)
}

