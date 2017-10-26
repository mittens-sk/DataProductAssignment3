irisData <- iris

server <- function(input, output) {
  formulaText <- reactive({
    paste(input$variable,"~ Species")
  })
  
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg ----
  # and only exclude outliers if requested
  output$irisPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = irisData,
            outline = input$outliers)
  })  
}