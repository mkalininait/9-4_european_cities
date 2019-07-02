library(shiny)
library(leaflet)

# UI for application that displays the world cities with defined number of citizens
shinyUI(fluidPage(

    # Application title
    titlePanel("World cities by population"),

    # Sidebar with a slider to input population and radiobuttons to choose an area to focus on
    sidebarLayout(
        sidebarPanel(
            sliderInput("population",
                        "Population:",
                        min = 100000,
                        max = 36000000,
                        value = c(5000000, 36000000)),
            radioButtons("area", "Area:",
                         c("Africa" = "africa",
                           "Asia" = "asia",
                           "Europe" = "europe",
                           "Middle East" = "mideast",
                           "North America" = "namerica",
                           "Oceania" = "oceania",
                           "South America" = "samerica"))
        ),

        # Show the map
        mainPanel(
            leafletOutput("map")
        )
    )
))
