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
  mutate(country = as.character(country),
         continent = as.character(continent))


# Steps 2-4: Define UI for application

ui <- fluidPage(
  
    # Step 2: Add application title
    titlePanel("Gapminder Shiny App"),

    sidebarLayout(
      
        # Step 3: Add sidebar
        sidebarPanel(
            
            pickerInput(inputId = "country", 
                        label = "Country",  
                        choices = unique(dataset$country),
                        selected = unique(dataset$country),
                        options = list(`actions-box` = TRUE),
                        multiple = T),
            
            checkboxGroupInput(inputId = "continent", 
                               label = "Continent", 
                               choices = c("Africa", "Americas", "Asia", "Europe", "Oceania"),
                               selected = c("Africa", "Americas", "Asia"),
                               inline = TRUE),
            
            sliderInput(inputId = "lifeExp", 
                        label = "Life Expectancy",  
                        min = 20,
                        max = 83,
                        value = c(50,80)),
            
            pickerInput(inputId = "year", 
                        label = "Year",  
                        choices = unique(dataset$year),
                        selected = unique(dataset$year),
                        options = list(`actions-box` = TRUE),
                        multiple = T),
            
            actionButton(inputId = "reset_input", 
                         label = "Reset all inputs", 
                         icon = icon("edit"),
                         style = "background-color: #a2e18e")
            
        ),

        # Step 4: Add main panel 
        mainPanel(
           
            # Output: Tabset with boxplot and table
             tabsetPanel(type = "tabs",
                         
                         tabPanel("Boxplot", 
                                  
                                  br(),
                                  
                                  plotlyOutput("boxplot", height = 500)
                                  
                                  ),
                         
                         tabPanel("Table", 
                                  
                                  br(),
                                  
                                  downloadButton(outputId = "downloadData",
                                                 label = "Download data"),
                                  
                                  br(),
                                  
                                  dataTableOutput("table"))
             )
            
        )
    )
)

# Steps 5-9: Define server section

server <- function(input, output, session) {
  
  # Step 5: Create a filtered dataset
  dataset_filtered <- reactive({
    
    dataset %>% 
      filter(country %in% input$country,
             continent %in% input$continent,
             lifeExp > input$lifeExp[1],
             lifeExp < input$lifeExp[2],
             year %in% input$year)
  
    })
  
  
  # Step 6: Add default values for Reset inputs button
  observe({
    input$reset_input
    updateTextInput(session, "country", value = unique(dataset$country))
    updateTextInput(session, "continent", value = c("Africa", "Americas", "Asia"))
    updateSliderInput(session, "lifeExp", value = c(50,80))
    updateTextInput(session, "year", value = unique(dataset$year))
    
  })
  
  # Step 7: Create a plotly boxplot  
  output$boxplot <- renderPlotly({
    
    ggplotly(
      
    dataset_filtered() %>%
        ggplot(aes(y = lifeExp, 
                   x = continent,
                   fill = continent,
                   text = country,
                   label = year))+
        geom_boxplot() + 
        geom_jitter(alpha = 0.4, width = 0.25) +
        labs(title = "Distribution of life expectancy by continent",
             x = "Continent",
             y = "Life expectancy") + 
        theme_light(), 
    
    tooltip = c("text","label"))
    
    })
  
  
  # Step 8: Create a download data button 
  output$downloadData <- downloadHandler(
    filename = "gapminder_filtered.csv",
    content = function(file) {
      write.csv(dataset_filtered(), file, row.names = FALSE)
    }
  )
  
  # Step 9: Create an interactive table 
  output$table <- renderDataTable(
    dataset_filtered()
    )
  
}

# Step 10: Run the application 
shinyApp(ui = ui, server = server)
