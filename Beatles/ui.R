#Shiny Cheat Sheet: https://shiny.rstudio.com/images/shiny-cheatsheet.pdf


#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

beatles_names <- c("John", "Paul", "George", "Ringo")

shinyUI(
  bootstrapPage(
    h3("Frequency of Beatles names over time"),
    numericInput(
      "startyear", "Enter starting year",
      value = 1960, min = 1880, max = 2014, step = 1
    ),
    numericInput(
      "endyear", "Enter ending year",
      value = 1970, min = 1881, max = 2014, step = 1
    ),
    sliderInput(
      "ylow", "Enter Lower Limit of Y",
      value = 0, min = 0, max = 1
    ),
    numericInput(
      "yhigh", "Enter Upper Limit of Y",
      value = 1, min = 0, max = 1, step = 0.005
    ),
    checkboxGroupInput(
      'names', 'Names to display:',
      sort(unique(beatles_names)),
      selected = c("George", "Paul")
    ),
    plotOutput("plot")
  )
)