#For Coursera data science series:Developing data product, project1
#Define a server for the shiny app
shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    quakes[, c(input$x1, input$x2)]
  })
  
  clusters <- reactive({
      kmeans(selectedData(), input$clusters)
  })


#output includes two plots:
  output$plot1 <- renderPlot({
  # Determine clusters numbers
  wgss <-  (nrow(selectedData())-1)*sum(apply(selectedData(),2,var))
        for (i in 2:input$slider1) wgss[i] <- sum(kmeans(selectedData(), 
                                          centers=i)$withinss)
  #Plots
  par(mfrow=c(1,2), oma=c(3,4,3,2), mar=c(5,5,5,5))

  p1 <- plot(1:input$slider1, wgss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares", main='Determination of Clusters Numbers', lwd=1.5, cex.axis=2, cex.lab=2, cex.main=2) 
  
  p2 <- clusplot(selectedData(), main ='Bivariate Clustering of Quakes Dataset',sub = '',clusters()$cluster, xlab= input$x1, ylab = input$x2, 
                 color=T, shade=T, labels=0, lines=1, lwd=1.5, cex.axis=2, cex.lab=2, cex.main=2)
    
  })
})