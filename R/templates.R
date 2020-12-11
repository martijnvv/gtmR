#' GTM template list
#'
#' Downloads all templates available in the container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @param workspaceId Add the workspace ID from your container
#' @export
#'
gtm_list_templates <- function(accountId, containerId, workspaceId){
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces/%s/templates",
                       accountId, containerId, workspaceId)
  
  f_fol <- googleAuthR::gar_api_generator(build_url, "GET")
  f <- f_fol()
  as.data.frame(f$content) -> f
}


#' #' GTM template list
#' #'
#' #' Downloads all templates available in the container
#' #'
#' #' @param accountId Add your GTM account ID
#' #' @param containerId Add your GTM container ID
#' #' @param workspaceId Add the workspace ID from your container
#' #' @param templateId Unique ID of a template
#' #' @export
#' #'
#' gtm_update_template <- function(accountId, containerId, workspaceId, templateId){
#'   
#'   build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces/%s/templates/%s",
#'                        accountId, containerId, workspaceId, templateId)
#'   
#'   f_fol <- googleAuthR::gar_api_generator(build_url, "PUT")
#' }

