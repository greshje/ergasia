# ---
#
# A class to encapsulate functionality related to the connection cache used by Strategus.  
#
# ---

# libraries
library(R6)

# imports
source("./R/impl/configuration/ConfigurationFactory.R")

ConnectionCacheUtil = R6Class(
  
  classname = "ConnectionCacheUtil",
  
  public = list(
    
    # ---
    #
    # A function to check to see if environment variables have been set.  
    #
    # ---
    
    checkEnv = function() {
      if(
        Sys.getenv("STRATEGUS_KEYRING_PASSWORD") == "" || 
        Sys.getenv("INSTANTIATED_MODULES_FOLDER") == "" || 
        Sys.getenv("GITHUB_PAT") == ""
      ) {
        msg <- "\n"
        msg <- paste(msg, "* ----------------------------- \n")
        msg <- paste(msg, "* \n")
        msg <- paste(msg, "* ENVIRONMENT NOT CORRECTLY CONFIGURED: \n")
        msg <- paste(msg, "* \n")
        msg <- paste(msg, "* The following parameters need to be set in .Renviron \n")
        msg <- paste(msg, "*   GITHUB_PAT='ghp_ThisIsMyGithubPersonalAccessTokenM2bgp91'\n")
        msg <- paste(msg, "*   INSTANTIATED_MODULES_FOLDER='C:/path/to/where/you/want/to/store/modules'\n")
        msg <- paste(msg, "*   STRATEGUS_KEYRING_PASSWORD='sos'\n")
        msg <- paste(msg, "* \n")
        msg <- paste(msg, "*   To set the parameters run the following to edit the contents of the .Renviron file.\n")
        msg <- paste(msg, "*   Restart R after editing .Renviron for the changes to take effect.\n")
        msg <- paste(msg, "*   usethis::edit_r_environ()\n")
        msg <- paste(msg, "* \n")
        msg <- paste(msg, "* ----------------------------- \n")
        writeLines(msg)
        usethis::edit_r_environ() 
        stop("Set .Renviron before running this script")
      }
    },
    
    # ---
    #
    # A function to list existing key rings.  
    #
    # ---
    
    getExistingKeyrings = function () {
      return(keyring::keyring_list())
    },
    
    # ---
    #
    # A function to create a keyring if it does not exist.  
    #
    # ---
    
    createKeyring = function(keyringName) {
      allKeyrings <- keyring::keyring_list()
      if (!(keyringName %in% allKeyrings$keyring)) {
        print(paste("Keyring not found, creating it now: ", keyringName))
        keyring::keyring_create(keyring = keyringName, password = Sys.getenv("STRATEGUS_KEYRING_PASSWORD"))
        print(paste("Keyring created: ", keyringName))
      } else {
        print("Keyring already exists. You do not need to create it again.")
      }
    },
    
    # ---
    #
    # A function to delete a keyring.
    #
    # ---
    
    deleteKeyring = function (keyringName) {
      keyring::keyring_delete(keyringName)
    },    

    # ---
    #
    # A function to store connection details
    #
    # ---
    
    storeCdmConnectionDetails = function(connectionDetails) {
      # get the config and key ring
      browser()
      config <- ConfigurationFactory$getConfiguration()
      keyringName = config$keyRingName
      # get the cacheUtil
      cacheUtil <- ConnectionCacheUtil$new()
      # set up the keyring
      cacheUtil$checkEnv()
      cacheUtil$createKeyring(keyringName)
      # save the cdm connection details for strategus
      Strategus::storeConnectionDetails(
        connectionDetails = connectionDetails,
        connectionDetailsReference = config$dataPartnerName,
        keyringName = keyringName
      )
    }
    
  )

)

ConnectionCacheUtil$createAndStoreCdmConnectionDetails <- function () {
  connectionDetails <- ConnectionDetailsFactory$new()$getCdmConnectionDetails()
  ConnectionCacheUtil$new()$storeCdmConnectionDetails(connectionDetails)
}




