#Shiny Cheat Sheet: https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(tidyverse)
library(babynames)
library(shiny)

Beatles <- babynames %>%
  filter(name %in% c("John", "Paul", "George", "Ringo") & sex == "M")

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      ds <- Beatles %>%
        filter(
          year >= input$startyear, year <= input$endyear,
          name %in% input$names
        )
      ggplot(data = ds, aes(x = year, y = prop, color = name)) +
        geom_line(size = 2) + ylim(input$ylow, input$yhigh)
    })
    
    
  }
)