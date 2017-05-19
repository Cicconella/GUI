require(shiny)

fluidPage(
  
  # *Input() functions,
  
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  
  textInput(inputId = "title",
            label = "Write a title",
            value = "Histogram of Random Normal Values"),
  
  plotOutput("hist"),
  
  verbatimTextOutput("stats") 
  
  # *Output() functions
  
)