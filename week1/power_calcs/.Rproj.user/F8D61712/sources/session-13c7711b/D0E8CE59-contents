library(shiny)
source("helpers.R")

# Define UI 
ui <- fluidPage(
  
  # App title ----
  titlePanel("Simple power analysis"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
    
     # Input: values for sd
     numericInput(inputId='sd',
                  label = "SD",
                  value=1
     ),
     # Input: values for mde
     numericInput(inputId='mde',
                  label = "Minimum detectable effect",
                  value=0.1
     ),
     # Input: values for power
     numericInput(inputId='pow',
                  label = "Power",
                  value=0.8
     ),
     # Input: values for sig
     numericInput(inputId='sig',
                  label = "Significance",
                  value=0.05
     ),
     # Input: values for propensity
     numericInput(inputId='prop',
                  label = "Treatment Ratio",
                  value=0.5
     ),
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      htmlOutput(outputId="min_samp")
      
    )
  )
)

# Define server 
server <- function(input, output) {
  
  
  output$min_samp <- renderUI({
    sample_size = min_samp_comp(input$sd, input$mde, input$pow, input$sig, input$prop)
    
    ss_text <- paste("The minimum sample size is: ", 
          sample_size)
    
    treat_text <- paste("The size of the treatment group is: ", 
          ceiling(input$prop*sample_size))
    
    HTML(paste(ss_text, treat_text, sep = '<br/>'))
    
    })
}

shinyApp(ui = ui, server = server)


