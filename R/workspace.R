#' GTM workspace list
#'
#' Downloads all GTM workspaces for a defined container ID
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_list_workspaces <- function(accountId, containerId) {

  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces",
                       accountId, containerId)
  
  f_env <- googleAuthR::gar_api_generator(build_url, "GET")
  env <- f_env()
  as.data.frame(env$content)
}

#' GTM current workspace ID
#'
#' Downloads current workspace ID
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_current_workspace_id <- function(accountId, containerId){
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces",
                       accountId, containerId)
  
  f_env <- googleAuthR::gar_api_generator(build_url, "GET")
  env <- f_env()
  as.data.frame(env$content) -> df
  message("This is the workspace ID for \"", df[1,5], "\". In case you want to find others, use gtm_list_workspaces")
  df[1,4]
}
