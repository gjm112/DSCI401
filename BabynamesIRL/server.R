#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({
          library(babynames)
      library(tidyverse)
      babynames %>% filter(name == input$name &
                             year <= input$years[2] &
                             year >= input$years[1]) %>% 
        ggplot(aes(x = year, y = n, color = sex)) + 
        geom_line() + theme_minimal()

    })

}
