library(shiny)
library(cluster)
shinyUI(pageWithSidebar(
  headerPanel('Quakes clustering by K-means'),
  sidebarPanel(style="min-width:200px;max-width:300px", 
    selectInput(inputId ='x1', label = 'Variable 1:', names(quakes)),
    selectInput(inputId ='x2', label = 'Variable 2:', names(quakes),
                                   selected=names(quakes)[[2]]),

        numericInput('clusters', 'Cluster set:', 3, min = 1, max = 10),
    
    tags$head(
        tags$style(type="text/css", "select { width: 1000px; }")
  )),
  mainPanel(style="min-width:800px;max-width:1000px", 
    plotOutput('plot1', height=800)
           )
))