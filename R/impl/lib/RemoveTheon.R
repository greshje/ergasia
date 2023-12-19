# ---
#
# A class to remove the theon package:
# This functionality is implemented in theon, but for theon itself
# we would like to be able to do this indepent of the theon library/package.  
#
# ---


library(R6)

RemoveTheon = R6Class(
  
  classname = "RemoveTheon",
  
  public = list (
    
    removeTheon = function() {
      pkgName <- "theon"
      required <- requireNamespace(pkgName, quietly = TRUE)
      print(paste(pkgName, required, sep = ": "))
      if (required) {
        remove.packages(pkgName)
      }
    },
    
    forceRemoveTheon = function() {
      pkgName <- "theon"
      tryCatch({
        devtools::unload(pkgName)
      }, error = function(e) {
        writeLines(paste0("COULD NOT UNLOAD PACKAGE: ", pkgName))
      })
      tryCatch({
        self$removeTheon()
      }, error = function(e) {
        writeLines(paste0("COULD NOT REMOVE PACKAGE: ", pkgName))
      })
    }
    
  )
  
)