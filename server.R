library(shiny)
library(leaflet)
library(dplyr)

# Read the data set
df <- read.csv("worldcities.csv", sep=",")
df <- df %>% 
    select(city, country, lat, lng, population) %>% 
    filter(population >= 100000) # due to memory limitations on the free Shinyapps plan

# Areas centres to focus on
areas <- c("africa","asia","europe","mideast","namerica","oceania","samerica")
longitude <- c(16.4365448,103.8115853,16.3658202,43.5930421,-93.2864897,131.5578038,-63.7125257)
latitude <- c(2.6112207,20.8362968,48.2085942,26.0879818,41.447846,-28.8659027,-16.6936933)
areas_cent <- data.frame(lng=longitude,lat=latitude,row.names = areas)

# Server logic required to draw the map of the world cities
shinyServer(function(input, output) {
    
    # Render leaflet with the defined cities      
    output$map <- renderLeaflet({
 
        df_sub <- df %>% filter(population %in% (input$population[1]:input$population[2]))
        mymap <- leaflet(df_sub)
        mymap <- mymap %>%
            addTiles() %>%
            setView(lng=areas_cent[input$area,"lng"], 
                    lat=areas_cent[input$area,"lat"], 
                    zoom=3) %>%
            addMarkers(popup = paste("Country:", df_sub$country, "<br>",
                                     "City:", df_sub$city, "<br>",
                                     "Population:", df_sub$population))
        
    })

})
