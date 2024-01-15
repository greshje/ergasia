# ---
#
# A static class to set the libPaths
#
# ---

SetLibPaths <- {}

SetLibPaths$exec <- function () {
  # echo path
  .libPaths()
  # set the new path
  newPath <- c("C:/Program Files/R/R-4.2.3/library") 
  .libPaths(newPath)
  # echo new path
  .libPaths()
}

