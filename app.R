
source('global.R')

shinyApp(
  ui <- basicPage(
    textOutput("secret"),
    textOutput("secret2")
  ),
  server = function(input, output) {
    output$secret <- renderText(paste0("env secret = ", Sys.getenv('mySecret')))
    output$secret2 <- renderText(paste0("file secret = ", readLines('/myvolume/secret2')))
  }
)