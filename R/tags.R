#' GTM tags list
#'
#' Downloads all GTM tags that are enabled in the current workspace, container
#'
#' @param accountId Add your GTM account ID
#' @param containerId Add your GTM container ID
#' @param workspaceId Add the workspace ID from your container
#' @export
#'
gtm_list_tags <- function(accountId, containerId, workspaceId){

  build_url <- sprintf("https://www.googleapis.com/tagmanager/v2/accounts/%s/containers/%s/workspaces/%s/tags",
                       accountId, containerId, workspaceId)
  
  f_tag <- googleAuthR::gar_api_generator(build_url,
                             "GET")
  
  tag_list <- f_tag()
  as.data.frame(tag_list$content) -> df_tags
  df_tags[c("tag.paused", "tag.notes")[!(c("tag.paused", "tag.notes") %in% colnames(df_tags))]] = FALSE
  df_tags[,c("tag.tagId", "tag.name", "tag.type", "tag.parentFolderId", "tag.paused", "tag.notes")] 
}