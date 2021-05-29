
source('global.R')

shinyApp(
  ui <- basicPage(
    textOutput("secret")
  ),
  server = function(input, output) {
    output$secret <- renderText(nchar(Sys.getenv('mySecret')))
  }
)