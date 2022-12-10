#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(maps)
library(plotly)
library(rsconnect)
library(htmltools)
library(shinythemes)



  intro_page <- tabPanel(
    "Introduction",
    titlePanel("CO2 and Greenhouse Gas Emissions Country Research"),
    h3("Question & Specifics"),
    p("In this assignment, I mainly want to resolve the question", strong("which country have the highest CO2 emission and how does it changes over years?"),"so I made this global map graph to compare each countries the emission. I used the data compiled by", em("Our World In Data")),
    h3("Variables"),
    p("From the dataset, I selected the three variables including country, year, and co2, which is the CO2 emission that year"),
    h3("Three Relevant Values"),
    h4("Value 1"),p("Using the graph, we can easily see that in the current year, China is the country with most CO2 emission, which has 11472 kiloton."),
    h4("Value 2"),p("Similarly, in the current year, the minimum CO2 emission of one country can be as small as 0, so we can really understand the emssion gap in between all the countries."), 
    h4("Value 3"),p("Lastly, the mean and median values are 200.5285 kiloton and 12.283 kiloton, respectively. Therefore, the distribution of this emission data is skewed to the right, which means there are some countries with huge amount of emission that pull up the whole world's emission average.")
  )
    
 
  page_one <- tabPanel(
    "Graph",  
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


ui <- navbarPage(
  theme = shinythemes::shinytheme("journal"),
  "Global CO2 Emission",
  intro_page,
  page_one)
