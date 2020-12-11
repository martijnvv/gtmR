#' GTM triggers list
#'
#' Downloads all GTM triggers that are enabled in the current workspace, container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @param workspaceId Add the workspace ID from your container
#' @export
#'
gtm_list_triggers <- function(accountId, containerId, workspaceId){

  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces/%s/triggers",
                       accountId, containerId, workspaceId)
  
  f_tri <- gar_api_generator(build_url,
                             "GET")
  t <- f_tri()
  as.data.frame(t$content) -> t
  t[c("trigger.parentFolderId", "trigger.notes")[!(c("trigger.parentFolderId", "trigger.notes") %in% colnames(t))]] = FALSE
  t[,c("trigger.triggerId", "trigger.name", "trigger.type", "trigger.parentFolderId","trigger.notes")] -> t
}