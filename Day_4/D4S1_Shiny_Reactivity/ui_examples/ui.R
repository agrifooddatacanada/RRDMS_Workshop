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

## Examples of Basic UI Components
fluidPage(
  titlePanel("Basic UI Components"),
  
  sidebarLayout(
    sidebarPanel(
      h2("Inputs"),
      h3("Numeric"),
      numericInput("num1", "Number one", value = 0, min = 0, max = 100),
      sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
      sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100),
      sliderInput("plot", "Plot this range:", value = c(10, 20), min = 0, max = 100),
      
      h3("Text"),
      textInput("name", "What's your name?"),
      passwordInput("pwd", "What's your password?"),
      textAreaInput("story", "Tell me about yourself:", rows = 3),
      
      h3("Date"),
      dateInput("dob", "When were you born?"),
      dateRangeInput("holiday", "When do you want to go on vacation next?"),
      
      h3("Limited choices"),
      
      selectInput("state1", "What's your favourite state?", state.name),
      radioButtons("rb1", "What's your favourite animal?", animal_names),
      radioButtons("rb2", "Choose one animal:",
                   choiceNames = animal_names,
                   choiceValues = animal_values
      ),
      
      selectInput("iris_filter", "Select species:", unique(iris$Species)),
      
      h3("Multiple choices"),
      selectInput(
        "state2", "What are your favourite states?", state.name,
        multiple = TRUE
      ),
      
      h3("File upload"),
      fileInput("upload", "Upload your file"),
      
      h3("Action button"),
      actionButton("click", "Click me!", icon = icon("thumbs-up"))
      
    ),
    
    mainPanel(
      h2("Outputs"),
      h3("Texts"),
      verbatimTextOutput("num1_out"),
      verbatimTextOutput("num2_out"),
      verbatimTextOutput("rng_out"),
      verbatimTextOutput("name_out"),
      verbatimTextOutput("pwd_out"),
      verbatimTextOutput("story_out"),
      verbatimTextOutput("state1_out"),
      verbatimTextOutput("rb1_out"),
      verbatimTextOutput("rb2_out"),
      verbatimTextOutput("state2_out"),
      verbatimTextOutput("dob_out"),
      verbatimTextOutput("holiday_out"),
      verbatimTextOutput("click_out"),
      
      h3("Plot"),
      plotOutput("plot_out"),
      
      h3("Tables"),
      h4("Filtered Iris"),
      tableOutput("iris_filtered_out"),
      h4("My uploaded table"),
      tableOutput("upload_out")
    )
  )
)