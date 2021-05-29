#' @apiTitle My R Service
#' @apiDescription This service runs R scripts on Google Cloud Run.

print(paste('Test Secret:', Sys.getenv('mySecret')))

mySecret <- Sys.getenv('mySecret')

#* Secret Test
#* @get /buildsecret
#* @serializer text
function(){
  
  Sys.getenv('mySecret')
}


#* Secret Test
#* @get /runsecret
#* @serializer text
function(){
  
  mySecret
}
# 
# #* health check
# #* @get /
# #* @serializer text
# function(){
#   
#   'healthy'
# }
# 
# 
# # EXAMPLE 3
# #* iris datatable
# #* @get /iris
# #* @serializer htmlwidget
# function(){
#   
#   DT::datatable(iris)
# }
# 
# # EXAMPLE 2
# #* Random Number from Uniform Distribution
# #* @param min Lower limit of the distribution.
# #* @param max Upper limit of the distribution.
# #* @get /runif
# #* @serializer html
# function(min = 0, max = 1){
#   
#   x <- runif(n = 1, 
#              min = as.numeric(min), 
#              max = as.numeric(max))
#   
#   paste0('<h3>', x, '</h3>')
# }
# 
# # EXAMPLE 1
# #* Confirmation Message
# #* @get /testing
# #* @serializer text
# function(msg=""){
#   "My R Service Deployed!"
# }