# ---
#
# Strategus gets its connection information from a connection that is stored in a keyring.  
#
# This script contains some examples using the key ring.  
#
# =--

# ---
#
# A function to get existing keyrings.  
#
# ---

source("./R/impl/connectioncache/ConnectionCacheUtil.R")
util <- ConnectionCacheUtil$new()
util$getExistingKeyrings()


# ---
#
# A function to remove the keyring used by the ergasia client.  
# (You'll be prompted if you really want to delete the key)
#
# ---

source("./R/impl/configuration/ConfigurationFactory.R")
keyringName <- ConfigurationFactory$getConfiguration()$keyringName
writeLines(paste0("Deleting keyring: ", keyringName))
keyring::keyring_delete(keyringName)

# ---
#
# View existing keyrings after the delete
#
# ---

keyring::keyring_list()


