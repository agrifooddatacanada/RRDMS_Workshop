############################### README ###################################
#
# This script is part of the workshop: Reusable Research Data Made Shiny
# from February 21st to 24th, 2023
# GitHub Page: https://github.com/agrifooddatacanada/RRDMS_Workshop
# Adapted from: https://mastering-shiny.org/basic-ui.html
#
# Day 3, Session 4
# Instructor: Lucas Alcantara, PhD
# Contact: alcantal@uoguelph.ca
#
######################################################################## #

library(shiny)

animal_names <- c("Atlantic Walrus", "Bowhead Whale", "Giant Panda", "Monarch Butterfly", "North Atlantic Right Whale")
animal_values <- c("atlantic_walrus", "bowhead_whale", "giant_panda", "monarch_butterfly", "north_atlantic_right_whale")

## Examples of Basic UI Components
ui <- fluidPage(
  h1("Basic UI Components"),
  
  h3("Numeric"),
  numericInput("num", "Number one", value = 0, min = 0, max = 100),
  sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
  sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100),
  
  h3("Text"),
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows = 3),
  
  h3("Date"),
  dateInput("dob", "When were you born?"),
  dateRangeInput("holiday", "When do you want to go on vacation next?"),
  
  h3("Limited choices"),
  
  selectInput("state1", "What's your favourite state?", state.name),
  radioButtons("rb1", "What's your favourite animal?", animal_names),
  verbatimTextOutput("rb1_out"),
  radioButtons("rb2", "Choose one:",
               choiceNames = animal_names,
               choiceValues = animal_values
  ),
  verbatimTextOutput("rb2_out"),
  
  h3("Multiple choices"),
  selectInput(
    "state2", "What's your favourite state?", state.name,
    multiple = TRUE
  ),
  
  h3("File upload"),
  fileInput("upload", "Upload your file"),
  
  h3("Action button"),
  actionButton("click", "Click me!", icon = icon("thumbs-up"))
)

server <- function(input, output, session) {
  output$rb1_out <- renderText(input$rb1)
  output$rb2_out <- renderText(input$rb2)
}

shinyApp(ui, server)