#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Install packages
list.of.packages <- c("shiny","shinyWidgets","tidyverse","gapminder","plotly")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# Load packages
library(shiny)
library(shinyWidgets)
library(tidyverse)
library(gapminder)
library(plotly)


# Step 1: Format the dataset as needed
dataset <- gapminder %>% 
  mutate()


# Steps 2-4: Define UI for application

ui <- fluidPage(
  
  # Step 2: Add application title
  titlePanel(""),
  
  sidebarLayout(
    
    # Step 3: Add sidebar
    sidebarPanel(
      
      pickerInput(inputId = "country", 
                  label =  ,
                  choices = ,
                  selected = ,
                  options = ,
                  multiple = ),
      
      checkboxGroupInput(inputId = "continent", 
                         label = , 
                         choices = ,
                         selected = ,
                         inline = ),
      
      sliderInput(inputId = "lifeExp", 
                  label = ,  
                  min = ,
                  max = ,
                  value = ),
      
      pickerInput(inputId = "year", 
                  label = ,  
                  choices = ,
                  selected = ,
                  options = ,
                  multiple = ),
      
      actionButton(inputId = "reset_input", 
                   label = , 
                   icon = ,
                   style = )
      
    ),
    
    # Step 4: Add main panel 
    mainPanel(
      
      # Output: Tabset with boxplot and table
      tabsetPanel(type = "tabs",
                  
                  tabPanel("Boxplot", 
                           
                           
                  ),
                  
                  tabPanel("Table", 
                           
                  )
      )
      
    )
  )
)

# Steps 5-9: Define server section

server <- function(input, output, session) {
  
  # Step 5: Create a filtered dataset
  dataset_filtered <- reactive({
    
    
  })
  
  
  # Step 6: Add default values for Reset inputs button
  observe({
    input$reset_input
    
    
  })
  
  # Step 7: Create a plotly boxplot  
  output$boxplot <- renderPlotly({
    
    
  })
  
  
  # Step 8: Create a download data button 
  output$downloadData <- downloadHandler(

    
  )
  
  # Step 9: Create an interactive table 
  output$table <- renderDataTable(

  )
  
}

# Step 10: Run the application 
shinyApp(ui = ui, server = server)
