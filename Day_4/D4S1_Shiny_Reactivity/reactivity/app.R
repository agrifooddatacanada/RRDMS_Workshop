############################### README ###################################
#
# This script is part of the workshop: Reusable Research Data Made Shiny
# from February 21st to 24th, 2023
# GitHub Page: https://github.com/agrifooddatacanada/RRDMS_Workshop
# Adapted from: https://mastering-shiny.org
#
# Day 4, Session 1
# Instructor: Lucas Alcantara, PhD
# Contact: alcantal@uoguelph.ca
#
######################################################################## #

library(shiny)

name <- "Lucas"

# Define UI for the application
ui <- fluidPage(
  textInput("name", "What's your name?"),
  actionButton("show", "Show Answer"),
  textOutput("greeting")
)

# Define server logic required
server <- function(input, output) {
  
  ## Server 1
  # output$greeting <- renderText(paste("Hello,", input$name))
  
  ## Server 2
  # greeting <- paste("Hello,", input$name)
  # output$greeting <- renderText(greeting)
  
  ## Server 3
  # output$greeting <- paste("Hello,", input$name)
  
  ## Solution
  output$greeting <- renderText(answer())
  answer <- eventReactive(input$show, {
    paste("Hello,", input$name)
    })
  
  observeEvent(input$show, {
    print(
      paste("The value of inpuut$name is",
                input$name)
      )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
