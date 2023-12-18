# ---
#
# A class to encapsulate basic library/package related functionality
#
# ---

library(R6)

OhdsiLibUtil = R6Class(

    classname = "OhdsiLibUtil",

    public = list (
        test = function() {
          print("Test worked.")
        }
    )

)
