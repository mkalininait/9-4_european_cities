library(shiny)
library(leaflet)
library(dplyr)

# Server logic required to draw the map of the world cities
shinyServer(function(input, output) {

    df <- read.csv("worldcities.csv", sep=",")
    df <- df %>% 
        select(city, lat, lng, population) %>% 
        filter(!is.na(population))
            
    output$map <- renderLeaflet({
            
        df <- df %>% filter(population %in% (input$population[1]:input$population[2]))
        mymap <- leaflet(df) 
        mymap <- addTiles(mymap)
        mymap <- setView(mymap, lng=16.3658202, lat=48.2085942, zoom=4)
        mymap <- addMarkers(mymap, popup = paste("City:", df$city, "<br>",
                                                 "Population:", df$population))
          
    })

})
