library(shiny)
library(firebase)

ui <- fluidPage(
  useFirebase(), # import dependencies
  firebaseUIContainer(),
  plotOutput("plot")
)

server <- function(input, output){
  f <- FirebaseUI$
    new()$ # instantiate
    set_providers( # define providers
      google = TRUE
    )$
    launch() # launch
  
  output$plot <- renderPlot({
    f$req_sign_in() # require sign in
    
    email <-
      f$get_signed_in()$response$email
    
    # Require MA email address
    if(!stringr::str_detect(tolower(email), 'minnehahaacademy')){
      stop("Unauthorized!")
    }
    
    plot(cars)
  })
  
  observeEvent(input$signout, {
    f$sign_out()
  })
}

shinyApp(ui, server)