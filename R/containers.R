#' GTM container list
#'
#' Downloads all GTM containers for a defined account ID
#'
#' @param accountId Add your GTM account ID to get the list of containers
#' @export
#'
gtm_list_containers <- function(accountId){
  acc_url <- "https://www.googleapis.com/tagmanager/v2/accounts"
  f_con <- gar_api_generator(paste(acc_url, "/",accountId,"/containers", sep = ""),
                             "GET")
  c<- f_con()
  as.data.frame(c$content)
}


#' Get individual GTM account detail
#'
#' @param accountId accountId to request
#' @param containerId GTM containerId
#'
#' @return container info
#' @export
gtm_get_container <- function(accountId,
                              containerId){
  
  build_url <- sprintf("https://www.googleapis.com/tagmanager/v1/accounts/%s/containers/%s",
                       accountId, containerId)
  
  container <- googleAuthR::gar_api_generator(build_url,
                                              "GET",
                                              data_parse_function = function(x) x)
  
  container()
  
}

#' GTM create a container
#'
#' Create a GTM container
#'
#' @param accountId Add your GTM account ID
#' @param containerName Name of the container you want to create
#' @param containerType Type of container (web or amp)
#' @param containerDomain Domainname related to the container (optional)
#' @export
#'
gtm_create_container <- function(accountId, containerName, containerType, containerDomain = NULL){
  
  list(containerType) -> containerType
  list(containerDomain) -> containerDomain
  
  cont_url <- paste("https://www.googleapis.com/tagmanager/v2/accounts/",accountId, "/containers", sep = "")
  body = list(
    name = containerName,
    usageContext = containerType,
    domainName = containerDomain
  )
  
  f <- gar_api_generator(cont_url,
                         "POST")
  f(the_body = body)
}
