############################### README ###################################
#
# This script is part of the workshop: Reusable Research Data Made Shiny
# from February 21st to 24th, 2023
# GitHub Page: https://github.com/agrifooddatacanada/RRDMS_Workshop
# Adapted from: https://github.com/rstudio/shiny-examples/blob/main/050-kmeans-example
#
# Day 3, Session 4
# Instructor: Lucas Alcantara, PhD
# Contact: alcantal@uoguelph.ca
#
######################################################################## #

# Create server function
function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  
  # Create the clusters
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  # Render the plot
  output$plot1 <- renderPlot({
    # Define a color palette
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                       "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

    # Define plot margins
    par(mar = c(5.1, 4.1, 0, 1))
    
    # Create plot
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    
    # Add an X to the center of the clusters
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
}