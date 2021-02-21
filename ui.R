
library(shiny)


# Define UI for miles per gallon app ----
ui <- fluidPage(
    
    # App title ----
    titlePanel("Miles Per Gallon"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            # Input: Selector for variable to plot against mpg ----
            selectInput("variable", "Variable:",
                        c("Cylinders" = "cyl",
                          "Weight (lb/1000)" = "wt",
                          "Transmission" = "am",
                          "Gears" = "gear",
                          "Displacement (cu.in.)" = "disp",
                          "Gross horsepower" = "hp",
                          "Rear axle ratio" = "drat",
                          "1/4 mile time" = "qsec",
                          "V/S" = "vs",
                          "Number of carburetors" = "carb"
                        )),
            
            # Input: Checkbox for whether outliers should be included ----
            checkboxInput("outliers", "Show outliers", TRUE)
            
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(
            
            # Output: Formatted text for caption ----
            h3(textOutput("caption")),
            
            # Output: Plot of the requested variable against mpg ----
            plotOutput("mpgPlot")
            
        )
    )
)
