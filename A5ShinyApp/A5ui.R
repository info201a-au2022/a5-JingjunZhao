#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("https://raw.githubusercontent.com/info201a-au2022/a5-JingjunZhao/main/A5ShinyApp/A5server.R")

shinyUI(fluidPage(

   
    titlePanel("Change over CO2 Emission in Years among Countries"),


    sidebarLayout(
            sliderInput("year",
                        "Year",
                        min = min(map_CO2$year),
                        max = max(map_CO2$year),
                        value = max(map_CO2$year)
        )),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput(outputId = 'map')
            
        )
))

