############################### README ###################################
#
# This script is part of the workshop: Reusable Research Data Made Shiny
# from February 21st to 24th, 2023
# GitHub Page: https://github.com/agrifooddatacanada/RRDMS_Workshop
# Adapted from: https://mastering-shiny.org/basic-reactivity.html
#
# Day 3, Session 4
# Instructor: Lucas Alcantara, PhD
# Contact: alcantal@uoguelph.ca
#
######################################################################## #

library(shiny)

## Examples of Basic UI Components
ui <- fluidPage(
  h1("Basic UI Components"),
  
  h3("Texts"),
  textInput("name_in", "What's your name?"),
  textOutput("name_out"),
  
  passwordInput("pwd_in", "What's your password?"),
  verbatimTextOutput("pwd_out"),
  
  dateRangeInput("date_in", "When do you want to go on vacation next?"),
  verbatimTextOutput("date_out"),
  
  selectInput(
    "state_in", "What's your favourite state?", state.name,
    multiple = TRUE
  ),
  verbatimTextOutput("state_out"),
  
  h3("Tables"),
  tableOutput("iris_head"),
  
  h3("Plots"),
  plotOutput("plot"),
  
  h3("Reactive Expression and Execution Order"),
  textOutput("greeting"),
  textOutput("greeting2")
  
)

server <- function(input, output, session) {
  output$name_out <- renderText({
    paste(
      "My name is",
      input$name_in
    )
  })
  
  output$pwd_out <- renderText(input$pwd_in)
  
  output$date_out <- renderText(format(input$date_in))
  
  output$state1_out <- renderPrint(input$state_in)
  
  output$rb1_out <- renderText(input$rb1)
  
  output$rb2_out <- renderText(input$rb2)
  
  output$state_out <- renderPrint(input$state_in)
  
  output$iris_head <- renderTable(head(iris))
  
  output$plot <- renderPlot(plot(1:5))
  
  string <- reactive(paste0("Hello ", input$name_in, "!"))
  
  output$greeting <- renderText(string())
  
  output$greeting2 <- renderText({
    paste0('He said: \"', string(), "\"")
  })
  
}

shinyApp(ui, server)