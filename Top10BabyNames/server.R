#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(babynames)
library(tidyverse)



# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$babytable <- renderTable({

        babynames %>% 
        filter(year >= input$start, year <= input$end, sex == input$sex) %>%
        group_by(name) %>% 
        summarize(total = sum(n)) %>% 
        arrange(desc(total))
        

    })

})
