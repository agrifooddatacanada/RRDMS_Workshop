#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Multi-page Layout"),
  dashboardSidebar(
    numericInput("num1", "Number one", value = 0, min = 0, max = 100),
    sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
    sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100)
  ),
  dashboardBody(
    tabsetPanel(
      tabPanel("panel 1", "Panel one contents"),
      tabPanel("panel 2", "Panel two contents"),
      tabPanel("panel 3", "Panel three contents")
    )
  )
)

server <- function(input, output, session) {
}

# Run the application 
shinyApp(ui = ui, server = server)
