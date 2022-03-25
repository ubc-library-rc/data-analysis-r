#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(gapminder)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Life expectancy data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "Bins",
                        label = "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("histogram")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$histogram <- renderPlot({
      
      gapminder %>% 
        ggplot(aes(x = lifeExp)) +
        geom_histogram(bins = input$Bins, 
                       color = "black", fill = "lightblue")
      
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
