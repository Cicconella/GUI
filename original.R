source("http://bioconductor.org/biocLite.R")
require(igraph)
require(plotrix)
library(STRINGdb)
require(shiny)
source("/home/cicconella/Desktop/GUI/funcoes.R")

### UI

ui <- fluidPage(
  
  titlePanel("Create Network"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "nome1",
                label = "Name of the list",
                value = "Group 1"),
      fileInput(inputId = "list1", label = "Select a list of genes"),
      textInput(inputId = "nome2",
                label = "Name of the list",
                value = "Group 2"),
      fileInput(inputId = "list2", label = "Select a list of genes")
    ),
    mainPanel("Network")
  ),
  # *Input() functions,
  

  # *Output() functions

  tableOutput("tabela")
    
)

### Server

server <- function(input, output) {
 
  data1 = reactive({
    
    inFile <- input$list1
    
    read.table(inFile$datapath)

  })
  
  data2 = reactive({
    
    inFile <- input$list2
    
    read.table(inFile$datapath)
    
  })
  
  
 output$tabela = renderTable({
  
   arrumaTabela(data1(), data2(), input$nome1, input$nome2)
 #  dim(data())[1] 
    
 })
  
}

shinyApp(ui = ui, server = server)
