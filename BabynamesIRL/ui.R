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
fluidPage(

    # Application title
    titlePanel("Babyname Popularity Over Time"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("name",
                        "Enter a name, clownshow:",
                        "Greg"), 
            
            sliderInput("years", 
                        "Pick some years, clownshow:",
                        min = 1880, 
                        max = 2017, 
                        value = c(1900,2000), 
                        sep = ""
              
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)
