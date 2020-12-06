#' GTM folders list
#'
#' Downloads all folders available in the container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_list_folders <- function(accountId, containerId){
  gtm_workspace_id(accountId, containerId) -> ws
  cont_url <- paste("https://www.googleapis.com/tagmanager/v2/accounts/",accountId,"/containers", sep = "")
  fol_url <- paste(cont_url,"/",containerId, "/workspaces/",  ws, "/folders", sep = "")
  f_fol <- gar_api_generator(fol_url, "GET")
  f <- f_fol()
  as.data.frame(f$content) -> f
  f[,c("folder.folderId", "folder.name")]-> t
}

#' GTM create a folder
#'
#' Create a folder in GTM container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @param folderName Name of folder you would like to create
#' @export
#'
gtm_create_folder <- function(accountId, containerId,folderName){
  gtm_workspace_id(accountId, containerId) -> ws
  cont_url <- paste("https://www.googleapis.com/tagmanager/v2/accounts/",accountId,"/containers", sep = "")
  fol_url <- paste(cont_url,"/",containerId, "/workspaces/",  ws, "/folders", sep = "")

  body = list(
    name = folderName
  )
  
  f <- gar_api_generator(fol_url,
                           "POST")
  f(the_body = body)
} 
