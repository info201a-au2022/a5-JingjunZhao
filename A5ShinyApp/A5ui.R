#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


shinyUI(fluidPage(

   
    titlePanel("Old Faithful Geyser Data"),


    sidebarLayout(
        sidebarPanel(
            sliderInput("year",
                        "Year",
                        min = min(map_CO2$year),
                        max = max(map_CO2$year),
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            titlePanel("Health Spending as a Share of Government Expenditure"),
            plotlyOutput(outputId = ''),
        )
    )
))
