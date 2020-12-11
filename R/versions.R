#' GTM version list
#'
#' Downloads all GTM versions for a defined container ID
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_list_versions <- function(accountId, containerId){
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/version_headers",
                       accountId, containerId)
  
  f_env <- googleAuthR::gar_api_generator(build_url, "GET")
  env <- f_env()
  as.data.frame(env$content)
  
}

#' GTM current Version
#'
#' Downloads the most recent GTM version for a defined container ID
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @export
#'
gtm_get_current_version <- function(accountId, containerId){
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/version_headers:latest",
                       accountId, containerId)
  
  f_env <- googleAuthR::gar_api_generator(build_url, "GET")
  env <- f_env()
  as.data.frame(env$content)
  
}