server <- function(input, output) {
  
  data = reactive({
    rnorm(input$num)
  })
  
  output$hist <- renderPlot({
    hist(data(), main = input$title, nc = 100, 
         col = "blue", xlab = "Numbers")
  })
  
  output$stats <- renderPrint({
    summary(data())
  }) 
}
