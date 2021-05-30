
source('global.R')

shinyApp(
  ui <- basicPage(
    textOutput("secret"),
    textOutput("secret2")
  ),
  server = function(input, output) {
    message(dir.exists('/myvolume'))
    message(file.exists('/myvolume/secret2'))
    files <- list.files('/myvolume')
    files <- paste(files, collapse = ', ')
    dirs <- list.dirs('/myvolume')
    dirs <- paste(dirs, collapse = ', ')
    output$secret <- renderText(paste0("files = ", files))
    output$secret2 <- renderText(readLines('/myvolume/secret2'))
  }
)