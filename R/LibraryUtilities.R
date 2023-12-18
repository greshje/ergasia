# ---
#
# Function to expose functionality related to R libraries and packages.
#
# ---

getNewOhdsiLibUtil <- function() {
  rtn <- OhdsiLibUtil$new()
  return(rtn)
}

