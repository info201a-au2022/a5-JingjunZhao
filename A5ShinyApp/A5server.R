#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

owid<-read.csv("https://raw.githubusercontent.com/info201a-au2022/a5-JingjunZhao/main/owid-co2-data.csv")
library(shiny)
library(plotly)

world_map <- map_data("world")
owid_CO2<-select(owid,"country","co2","year")
names(owid_CO2)[1]<-paste("region")
map_CO2<-left_join(owid_CO2, world_map, by = "region")

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
