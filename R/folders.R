#' GTM folders list
#'
#' Downloads all folders available in the container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @param workspaceId Add the workspace ID from your container
#' @export
#'
gtm_list_folders <- function(accountId, containerId, workspaceId){

  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces/%s/folders",
                       accountId, containerId, workspaceId)
  
  f_fol <- googleAuthR::gar_api_generator(build_url, "GET")
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
#' @param workspaceId Add the workspace ID from your container
#' @export
#'
gtm_create_folder <- function(accountId, containerId, workspaceId, folderName){

  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces/%s/folders",
                       accountId, containerId, workspaceId)

  body = list(
    name = folderName
  )
  
  f <- gar_api_generator(build_url,
                           "POST")
  f(the_body = body)
} 
