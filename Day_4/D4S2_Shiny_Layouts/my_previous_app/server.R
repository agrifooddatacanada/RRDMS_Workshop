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

function(input, output, session) {
  output$rb1_out <- renderText(input$rb1)
  output$rb2_out <- renderText(input$rb2)
  
  output$num1_out <- renderText(paste("Number one:", input$num1))
  output$num2_out <- renderText(paste("Number two:", input$num2))
  output$rng_out <- renderText(paste("Range:", input$rng[[1]], "-", input$rng[[2]]))
  
  output$name_out <- renderText(paste("What's your name?", input$name))
  output$pwd_out <- renderText(paste("What's your password?", input$pwd))
  output$story_out <- renderText(paste("Tell me about yourself:", input$story))
  
  output$dob_out <- renderText(paste("When were you born?", input$dob))
  output$holiday_out <- renderText(paste("When do you want to go on vacation next? From", input$holiday[[1]], "to", input$holiday[[2]]))
  
  output$state1_out <- renderText(paste("What's your favourite state?", input$state1))
  output$rb1_out <- renderText(paste("What's your favourite animal?", input$rb1))
  output$rb2_out <- renderText(paste("Choose one animal:", input$rb2))
  
  output$state2_out <- renderText({
    my_states <- paste(input$state2, collapse = ", ")
    paste("What are your favourite states?", my_states)
  })
  
  output$iris_filtered_out <- renderTable({
    filtered_iris <- iris %>%
      filter(Species == input$iris_filter)
    
    head(filtered_iris)
  })
  
  output$upload_out <- renderTable({
    file <- input$upload
    req(file)
    
    data <- read_csv(file$datapath)
    head(data)
  })
  
  output$click_out <- renderText(paste("n times button was clicked:", input$click))
  
  output$plot_out <- renderPlot(plot(input$plot[[1]]:input$plot[[2]]))
}
