
source('global.R')

shinyApp(
  ui <- basicPage(
    textOutput("secret")
  ),
  server = function(input, output) {
    output$secret <- renderText(paste0("mySecret = ", Sys.getenv('mySecret')))
  }
)