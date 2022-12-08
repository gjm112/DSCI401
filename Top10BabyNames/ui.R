#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Top 10 Baby Names!"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("yearstart",
                        "Start Year",
                        min = 1880,
                        max = 2014,
                        value = 1900),
            numericInput("yearend",
                         "End Year",
                         min = 1880,
                         max = 2014,
                         value = 2000),
            radioButtons('sex',"Sex",c("M","F"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tableOutput("babytable")
        )
    )
))
