# ---
#
# A static class to remove the theon package:
# This functionality is implemented in theon, but for theon itself
# we would like to be able to do this indepent of the theon library/package.  
#
# ---

RemoveTheon <- {}

RemoveTheon$removeTheon <- function() {
  pkgName <- "theon"
  required <- requireNamespace(pkgName, quietly = TRUE)
  print(paste(pkgName, required, sep = ": "))
  if (required) {
    remove.packages(pkgName)
  }
}

RemoveTheon$forceRemoveTheon = function() {
  pkgName <- "theon"
  tryCatch({
    devtools::unload(pkgName)
  }, error = function(e) {
    writeLines(paste0("COULD NOT UNLOAD PACKAGE: ", pkgName))
  })
  tryCatch({
    RemoveTheon$removeTheon()
  }, error = function(e) {
    writeLines(paste0("COULD NOT REMOVE PACKAGE: ", pkgName))
  })
}


