#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(maps)
library(rsconnect)
library(htmltools)
library(ggplot2)
library(shiny)
library(plotly)
library(dplyr)
source("https://raw.githubusercontent.com/info201a-au2022/a5-JingjunZhao/main/A5ShinyApp/data.R")

server <- function(input, output) {
observeEvent(map_CO2, {
        updateSliderInput(
            inputId = "year",
            min = min(map_CO2$year),
            max = max(map_CO2$year),
            value = max(map_CO2$year)
        )
    })

filter_year <- reactive({
    map_CO2 %>%
        filter( year == input$year)
})

output$map<-renderPlotly({ggplotly(ggplot(filter_year(), aes(long, lat, group = group))+
                                       geom_polygon(aes(fill = co2))+ 
                                       scale_fill_gradient(low = "yellow", high = "red", na.value = NA))
    
})
}
