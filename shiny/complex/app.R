#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Install packages
list.of.packages <- c("shiny","shinyWidgets","shinythemes","shinyBS","rintrojs","tidyverse","gapminder","lubridate","plotly", "report", "ggpubr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# Load packages
library(shiny)
library(shinyWidgets)
library(shinythemes)
library(shinyBS)
library(rintrojs)
library(tidyverse)
library(gapminder)
library(lubridate)
library(plotly)
library(report)
library(ggpubr)


# Format the gapminder dataset as needed
dataset <- gapminder %>% 
  mutate(country = as.character(country),
         continent = as.character(continent))


# Define UI for application
ui <- fluidPage(
  
    # Application title
    titlePanel("Gapminder Shiny App"),
    
    
    # Set shiny theme
    theme = shinytheme("sandstone"),
    
    # Include to enable intro messages
    introjsUI(), 

    # Sidebar
    sidebarLayout(
        sidebarPanel(
          
          htmlOutput("picture1"), 
          
          br(),
          
          introBox(data.step = 1, data.intro = "Select your data here",
          
            pickerInput(inputId = "country", 
                        label = "Country",  
                        choices = unique(dataset$country),
                        selected = unique(dataset$country),
                        options = list(`actions-box` = TRUE),
                        multiple = T),
            
            checkboxGroupInput(inputId = "continent", 
                               label = "Continent", 
                               choices = c("Africa", "Americas", "Asia", "Europe", "Oceania"),
                               selected = c("Africa", "Americas", "Asia", "Europe"),
                               inline = TRUE),
            
            dateRangeInput(inputId = "year", 
                           label = "Year",
                           start = "1951-01-01", 
                           end = "2008-01-01", 
                           min = "1951-01-01",
                           max = "2008-01-01", 
                           format = "yyyy",
                           startview = "decade"),
            
            sliderInput(inputId = "lifeExp", 
                        label = "Life Expectancy",  
                        min = 20,
                        max = 83,
                        value = c(40,80)),
            
            sliderInput(inputId = "pop", 
                        label = "Population",  
                        min = min(dataset$pop)-1,
                        max = max(dataset$pop)+1,
                        value = c(10000000,1000000000)),
            
            sliderInput(inputId = "gdpPercap", 
                        label = "GDP per Capita",  
                        min = round(min(dataset$gdpPercap))-1,
                        max = round(max(dataset$gdpPercap))+1,
                        value = c(500,100000))
            ),
            
            
          introBox(data.step = 2, data.intro = "Reset all your values to default here",
                   
            popify(       
            actionButton(inputId = "reset_input", 
                         label = "Reset all inputs", 
                         icon = icon("edit"),
                         style = "background-color: #a2e18e"),
            "A button to reset inputs to default values",
                     "Press this button whenever you want to reset all your input values to default.")
            
        )
        
        ),

        # Main panel 
        mainPanel(
           
            # Output: Tabset w/ boxplot, scatterplot, and table ----
             tabsetPanel(type = "tabs",
                         
                         tabPanel("Boxplot", 
                                  
                                  br(),
                                  
                                  introBox(data.step = 3, data.intro = "See all your graphs and tables here",
                                           
                                  
                          tipify(selectInput(inputId = "variable", 
                                              label = "Select numeric variable",
                                              choices = colnames(dataset)[4:6],
                                              selected = "lifeExp"),
                                 "Select a numeric variable to plot in a boxplot"
                                 ),
                                  
                                  plotlyOutput("boxplot", height = 600)
                                  
                                  )
                         ),
                         
                         tabPanel("Scatterplot", 
                                  
                                  br(),
                                  
                                  column(4,
                                         selectInput(inputId = "y", 
                                              label = "Select Y-variable",
                                              choices = colnames(dataset)[4:6],
                                              selected = "gdpPercap")
                                         ),
                                  
                                  column(4,
                                         selectInput(inputId = "x", 
                                              label = "Select X-variable",
                                              choices = colnames(dataset)[4:6],
                                              selected = "lifeExp")
                                         ),
                                  
                                  column(4,
                                         selectInput(inputId = "color", 
                                                     label = "Select colour variable",
                                                     choices = colnames(dataset)[2:3],
                                                     selected = "continent")
                                         ),
                                  
                                  h4("Scatterplot with a best-fit line"),
                                  
                                  plotOutput("scatterplot", height = 500),
                                  
                                  h4("Statistical results"),
                                  
                                  htmlOutput("modelresults")
                                  
                                  ),
                         
                         
                         tabPanel("Plotly scatterplot", 
                                  
                                  br(),
                                  
                                  plotlyOutput("scatterplotly", height = 700)
                                  
                         ),
                         
                         
                         tabPanel("Barchart", 
                                  
                                  br(),
                                  
                                  column(4,
                                         selectInput(inputId = "year_", 
                                                     label = "Select year",
                                                     choices = unique(dataset$year),
                                                     selected = "2007")
                                  ),
                                  
                                  column(4,
                                         selectInput(inputId = "numeric_variable", 
                                                     label = "Select numeric variable",
                                                     choices = colnames(dataset)[4:6],
                                                     selected = "gdpPercap")
                                         ),
                                  
                                  column(4,
                                         sliderInput(inputId = "top_n", 
                                                     label = "Show top ... categories", 
                                                     value = 20, 
                                                     min = 1, 
                                                     max = 50)
                                         ),
                                  
                                  br(),
                                  br(),
                                  br(),
                                  br(),
                                  br(),
                                  
                                  plotlyOutput("barchart", height = 700)
                                  
                                  
                                  ),
                         
                         
                         tabPanel("Table", 
                                  
                                  br(),
                                  
                                  column(4,
                                         downloadButton(outputId = "downloadData",
                                                        label = "Download data")
                                         ),
                                  
                                  column(8,
                                         varSelectInput(inputId = "variables", 
                                                 label = "Select variables of interest",
                                                 data = dataset, 
                                                 selected = colnames(dataset)[c(1,3:6)], 
                                                 multiple = TRUE)
                                         ),
                                  
                                  br(),
                                  
                                  dataTableOutput("table"))
             )
             
            
        )
    )
)

# Server section
server <- function(input, output, session) {
  
  # Add a pop-up message
  observeEvent("", {
    showModal(modalDialog(
      "GAPMINDER Shiny App",
      easyClose = TRUE,
      size = "s",
      footer = tagList(
        actionButton(inputId = "intro", 
                     label = "Click for an introduction tour", 
                     icon = icon("info-circle"))
      )
    ))
  })
  
  #Intro boxes
  observeEvent(input$intro,{
    removeModal()
  })
  
  #Show intro tour
  observeEvent(input$intro,
               introjs(session, options = list("nextLabel" = "Continue",
                                               "prevLabel" = "Previous",
                                               "doneLabel" = "Let's go!"))
  )
  
  
  output$picture1 <-
    renderText({
      c(
        '<img src="',
        "https://www.gapminder.org/wp-content/themes/gapminder2/images/gapminder-logo.svg",
        '">'
      )
    })
  
  observe({
    input$reset_input
    updateTextInput(session, "country", value = unique(dataset$country))
    updateTextInput(session, "continent", value = c("Africa", "Americas", "Asia", "Europe"))
    updateDateRangeInput(session, "year", start = "1951-01-01", end = "2008-01-01")
    updateSliderInput(session, "lifeExp", value = c(40,80))
    updateSliderInput(session, "pop", value = c(10000000,1000000000))
    updateSliderInput(session, "gdpPercap", value = c(500,100000))
    
  })
  
  
  dataset_filtered <- reactive({
    
    dataset %>% 
      filter(country %in% input$country,
             continent %in% input$continent,
             year > year(input$year[1]),
             year < year(input$year[2]),
             lifeExp > input$lifeExp[1],
             lifeExp < input$lifeExp[2],
             gdpPercap > input$gdpPercap[1],
             gdpPercap < input$gdpPercap[2],
             pop > input$pop[1],
             pop < input$pop[2])
  
    })
    
  output$boxplot <- renderPlotly({
    
    ggplotly(
      
    dataset_filtered() %>%
        ggplot(aes_string(y = input$variable, 
                          x = "continent",
                          fill = "continent",
                          text = "country",
                          label = "year"))+
        geom_boxplot() + 
        geom_jitter(alpha = 0.4, width = 0.25) +
        labs(title = "Distribution of a selected variable by continent",
             x = "Continent") + 
        theme_light(), 
    
    tooltip = c("text","label"))
    
    })
  
  
  output$scatterplot <- renderPlot({
    
    dataset_filtered() %>%
      ggplot(aes_string(y = input$y, 
                        x = input$x))+
      geom_point(aes_string(color = input$color, size = "pop"))+
      geom_smooth(method = "lm", color = "black") + 
      theme_light()
  })
  
  
  model <- reactive({
    
    req(dataset_filtered(),input$x,input$y)
    x <- dataset_filtered()[[as.name(input$x)]]
    y <- dataset_filtered()[[as.name(input$y)]]
    model <- lm(y ~ x, data = dataset_filtered(), na.action=na.exclude)
    
  })
  
  output$modelresults <- renderUI({

    req(model())
    report(model())
    
  })

  
  
  output$scatterplotly <- renderPlotly({
    
    ggplotly(
      
      dataset_filtered() %>%
        ggplot(aes(x = gdpPercap, y = lifeExp, frame = year))+
        geom_point(aes(color = continent, size = pop, text = country, label = year))+
        geom_smooth(method="lm",se=FALSE, color = "black", size = 0.5)+
        scale_x_log10()+
        labs(title = "Life expetancy and GDP per capita",
             x = "Log 10 of GDP per capita", 
             y = "Life expectancy", 
             color = "Continent",
             size = "") + 
        theme_light(), 
      
      tooltip = c("text","label"))
    
  })
  
  
  output$barchart <- renderPlotly({
    
    ggplotly(
      
      dataset_filtered() %>% 
        filter(year == input$year_) %>% 
        arrange(desc(!!sym(input$numeric_variable))) %>% 
        head(input$top_n) %>% 
        ggplot(aes(y = !!sym(input$numeric_variable), 
                   x = reorder(country, !!sym(input$numeric_variable)),
                   fill = country,
                   label = year))+
        geom_bar(stat = "identity")+
        labs(title = "Top n countries by a selected variable", 
             x = "")+
        theme_light()+
        theme(legend.position = "none")+
        coord_flip(),
      
        tooltip = c("fill","y","label")
      )
   
    
  })
  

  output$downloadData <- downloadHandler(
    filename = function() {
      paste("gapminder_filtered", ".csv", sep = "")
    },
    content = function(file) {
      write.csv(dataset_filtered() %>% 
                select(!!!input$variables), file, row.names = FALSE)
    }
  )
  
  output$table <- renderDataTable(
    dataset_filtered() %>% 
      select(!!!input$variables)
    )
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
