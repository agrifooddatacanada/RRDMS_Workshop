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

# k-means only works with numerical variables,
# so don't give the user the option to select
# a categorical variable
vars <- setdiff(names(iris), "Species")

## Create page layout
pageWithSidebar(
  # Page title
  headerPanel('Iris k-means clustering'),
  
  # Define sidebar elements
  sidebarPanel(
    # Define select input for X Variable
    selectInput('xcol', 'X Variable', vars),
    
    # Define select input for Y Variable
    selectInput('ycol', 'Y Variable', vars, selected = vars[[2]]),
    
    # Define numeric input for number of clusters
    numericInput('clusters', 'Cluster count', 3, min = 1, max = 9)
  ),
  
  # Define main panel
  mainPanel(
    # Define plot output
    plotOutput('plot1')
  )
)