library(shiny)
library(cluster)

# Define the overall UI
shinyUI(
  
  fluidPage(
    tags$head(
      tags$style(type="text/css", ".irs { max-width: 1200px; }")
    ),
    titlePanel("K Means Clustering of Quakes dataset in R package"),
    
    # Create a new Row in the UI for selectInputs and numericInput
    

    fluidRow(
      column(width = 4, offset = 1,
             sliderInput("slider1", label = h3("Cluster number Slider"), min = 2, 
                         max = 20, value = 10, width = '600px'
             )
      ),
      column(width = 1, offset = 2,
             selectInput("x1",
                         h3("Variable 1:"),
                         names(quakes)
                        )
             ),
      column(width = 1, offset = 0.9,
             selectInput("x2",
                         h3("Variable 2:"),
                         names(quakes), selected=names(quakes)[[2]]
                         )
             ),

    column(width = 1, offset = 1.8,
           numericInput('clusters', h3('Cluster set:'), 3, min = 1, max = 10
                       )
             )
            ),
    # Create a new row for the plots
    fluidRow(
      plotOutput("plot1", height=700)
    )
  ))








 