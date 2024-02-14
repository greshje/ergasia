# ---
#
# Implementation of ConnectionDetailsForCdm that returns a Databricks connection
# and uses a keyring to store secret information.  
#
# ---

ConnectionDetailsForCdm <- {}

ConnectionDetailsForCdm$get <- function() {
  
  #
  # functions to get databricks token (user will be prompted for keyring password)
  #
  
  getToken <- function () {
    return (
      keyring::backend_file$new()$get(
        service = "production",
        user = "token",
        keyring = "databricks_keyring"
      )
    )
  }
  
  #
  # functions to get url with the token included
  #
  
  getUrl <- function () {
    url <- "jdbc:databricks://nachc-databricks.cloud.databricks.com:443/default;transportMode=http;ssl=1;httpPath=sql/protocolv1/o/3956472157536757/0123-223459-leafy532;AuthMech=3;UseNativeQuery=1;UID=token;PWD="
    return (
      paste(url, getToken(), sep = "")
    )  
  }
  
  connectionDetails <- DatabaseConnector::createConnectionDetails (
    dbms = "spark",
    connectionString = getUrl(),
    pathToDriver="D:\\_YES_2023-05-28\\workspace\\SosExamples\\_COVID\\02-data-diagnostics\\drivers\\databricks\\"
  )

  return(connectionDetails)  
  
}

