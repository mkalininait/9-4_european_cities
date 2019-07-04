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

        # Show two tabs: one with the map and one with the documentation
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Map", leafletOutput("map")),
                        tabPanel("Help", h2("How to use the app"), br(), 
                                 "Simply input the range of population 
                                 using the two-ended slider and select 
                                 the part of the world you'd like to focus 
                                 on. The map will update automatically.
                                 Sometimes the app may crash because of 
                                 the memory limitations on the free Shinyapps
                                 plan. In this case just reload the application.",
                                 br(), h2("Data"), br(),
                                 "The data on the world cities comes from the",
                                 a(href="https://simplemaps.com/data/world-cities",
                                   "simplemaps.com"),
                                 "website. We used the Basic database. The 
                                 database was updated in 2019."))
        )
    )
))
