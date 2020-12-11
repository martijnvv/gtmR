#' List GTM variables
#' 
#' @param accountId GTM account ID
#' @param containerId GTM Container ID
#' @param workspaceId Add the workspace ID from your container
#'
#' @return Dataframe of accountId, name
#' @export
gtm_list_variables <- function(accountId,
                               containerId, workspaceId){
  
  # build_url <- sprintf("https://www.googleapis.com/tagmanager/v1/accounts/%s/containers/%s/variables",
  #                      accountId, containerId)
  # 
  # vars <- googleAuthR::gar_api_generator(build_url,
  #                                        "GET",
  #                                        data_parse_function = function(x) x)
  # 
  # vars()
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces/%s/variables",
                       accountId, containerId, workspaceId)
  
  f_var <- googleAuthR::gar_api_generator(build_url,
                             "GET")
  variable_list <- f_var()
  as.data.frame(variable_list$content)
  
}

#' Get GTM variables
#' 
#' @inheritParams gtm_list_variables
#' @param variableId The GTM variable ID
#'
#' @return Dataframe of accountId, name
#' 
#' @seealso \href{https://developers.google.com/tag-manager/api/v1/reference/accounts/containers/variables/get}{Google Docs}
#'
#' @export
gtm_get_variables <- function(accountId,
                              containerId,
                              variableId){
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v1/accounts/%s/containers/%s/variables/%s",
                       accountId, containerId, variableId)
  
  vars <- googleAuthR::gar_api_generator(build_url,
                                        "GET",
                                        data_parse_function = function(x) x)
  
  vars()
  
}

#' GTM builtin Variables list
#'
#' Downloads all GTM Builtin Variables (name and type) that are enabled in the current workspace, container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @param workspaceId Add the workspace ID from your container
#' @export
#'
gtm_list_builtin <- function(accountId,containerId, workspaceId){

  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces/%s/built_in_variables",
                       accountId, containerId, workspaceId)
  
  f_ver <- googleAuthR::gar_api_generator(build_url,
                                          "GET")
  ver_list <- f_ver()
  ver_list$content$builtInVariable[,c("name", "type")]
  
}
