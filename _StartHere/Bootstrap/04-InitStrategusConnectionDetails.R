source("./R/impl/connection/ConnectionDetailsFactory.R")

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
# functions to get databricks token (user will be prompted for keyring password)
#

getUrl <- function () {
  url <- "jdbc:databricks://nachc-databricks.cloud.databricks.com:443/default;transportMode=http;ssl=1;httpPath=sql/protocolv1/o/3956472157536757/0123-223459-leafy532;AuthMech=3;UseNativeQuery=1;UID=token;PWD="
  return (
    paste(url, getToken(), sep = "")
  )  
}



connectionDetailsDatabricks <- DatabaseConnector::createConnectionDetails (
  dbms = "spark",
  connectionString = getUrl(),
  pathToDriver="D:\\_YES_2023-05-28\\workspace\\SosExamples\\_COVID\\02-data-diagnostics\\drivers\\databricks\\"
)


connectionDetails <- ConnectionDetailsFactory$getCdmConnectionDetails()

connectionDetailsReference <- "postgres_delete_me"

if (Sys.getenv("STRATEGUS_KEYRING_PASSWORD") == "") {
  # set keyring password by adding STRATEGUS_KEYRING_PASSWORD='sos' to renviron
  usethis::edit_r_environ()
  # then add STRATEGUS_KEYRING_PASSWORD='yourPassword', save and close
  # Restart your R Session to confirm it worked
  stop("Please add STRATEGUS_KEYRING_PASSWORD='yourPassword' to your .Renviron file
       via usethis::edit_r_environ() as instructed, save and then restart R session")
}

if (Sys.getenv("INSTANTIATED_MODULES_FOLDER") == "") {
  # set a env var to a path to cache Strategus modules
  usethis::edit_r_environ()
  # then add INSTANTIATED_MODULES_FOLDER='path/to/module/cache', save and close
  # Restart your R Session to confirm it worked
  stop("Please add INSTANTIATED_MODULES_FOLDER='{path to module cache folder}' to your .Renviron file
       via usethis::edit_r_environ() as instructed, save and then restart R session")
}

# Create the keyring if it does not exist.
keyringName <- "HowOften"
allKeyrings <- keyring::keyring_list()
if (!(keyringName %in% allKeyrings$keyring)) {
  keyring::keyring_create(keyring = keyringName, password = Sys.getenv("STRATEGUS_KEYRING_PASSWORD"))
} else {
  print("Keyring already exists. You do not need to create it again.")
}

# excecute this for each connectionDetails/ConnectionDetailsReference you are going to use
Strategus::storeConnectionDetails(
  connectionDetails = connectionDetails,
  connectionDetailsReference = connectionDetailsReference,
  keyringName = keyringName
)

# --- start test of connectionDetails -----------------------------------------------------------
testConnection <- DatabaseConnector::connect(connectionDetails)
testConnection 
DatabaseConnector::querySql(testConnection, "show tables in demo_cdm")
DatabaseConnector::disconnect(testConnection)
# --- end test of connectionDetails -------------------------------------------------------------



