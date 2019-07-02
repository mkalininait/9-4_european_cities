library(shiny)

# UI for application that displays the world cities with defined number of citizens or above it.
shinyUI(fluidPage(

    # Application title
    titlePanel("European cities by population"),

    # Sidebar with a slider input population of cities
    sidebarLayout(
        sidebarPanel(
            sliderInput("population",
                        "Population:",
                        min = 100000,
                        max = 11000000,
                        value = c(1000000, 5000000))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            leafletOutput("map")
        )
    )
))
