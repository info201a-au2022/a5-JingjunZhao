#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
owid<-read.csv("https://raw.githubusercontent.com/info201a-au2022/a5-JingjunZhao/main/owid-co2-data.csv")


ui <- shinyUI(fluidPage(

   
    titlePanel("Change over CO2 Emission in Years among Countries"),


    sidebarLayout(
            sliderInput("year",
                        "Year",
                        min = min(map_CO2$year),
                        max = max(map_CO2$year),
                        value = max(map_CO2$year)
        ),

  mainPanel(
        plotlyOutput(outputId = 'map'),
        p("This Chart shows the change of CO2 emission in different years in each country"))
))
)

