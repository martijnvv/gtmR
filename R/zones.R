#' GTM Zones list
#'
#' Downloads all GTM workspaces for a defined container ID
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @param workspaceId Add the workspace ID from your container
#' @export
#'
gtm_list_zones <- function(accountId, containerId, workspaceId) {

  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces/%s/zones",
                       accountId, containerId, workspaceId)
  
  f_env <- googleAuthR::gar_api_generator(build_url, "GET")
  env <- f_env()
  as.data.frame(env$content)
}