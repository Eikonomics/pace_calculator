# Load required libraries
library(shiny)
library(tidyverse)
library(hms)

# Define UI
ui <- fluidPage(
  titlePanel(title = "Distance Split Calculator"),
  
  
  
  sidebarLayout(
    sidebarPanel(
      numericInput("min", "Minutes per km:", value = 4, min = 0),
      numericInput("sec", "Seconds per km:", value = 15, min = 0, max = 59)
    ),
    
    mainPanel(
      h3("Main Distances Output"),
      tableOutput("main_distances_output"),
      
      h3("Marathon Splits Output"),
      tableOutput("marathon_splits_output")
    )
  )
)