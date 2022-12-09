#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(dplyr)
library(maps)
library(shiny)
library(rsconnect)
rsconnect::configureApp("A5ShinyApp", size="xlarge")
library(htmltools)
source("https://raw.githubusercontent.com/info201a-au2022/a5-JingjunZhao/main/A5ShinyApp/server.R")
source("https://github.com/info201a-au2022/a5-JingjunZhao/blob/main/A5ShinyApp/ui.R")
shinyApp(ui = ui, server = server)
