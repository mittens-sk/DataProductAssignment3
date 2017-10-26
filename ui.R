ui <- fluidPage(
  
  # App title ----
  titlePanel("Species Characteristic"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      p("Select features of the Iris and see the distribution of the sample datasets."),
      # Input: Selector for variable to plot against mpg ----
      selectInput("variable", "Variable:",
                  c("Sepal Length" = "Sepal.Length",
                    "Sepal Width" = "Sepal.Width",
                    "Petal Length" = "Petal.Length",
                    "Petal Width" = "Petal.Width")),
      
      # Input: Checkbox for whether outliers should be included ----
      checkboxInput("outliers", "Show outliers", TRUE),
      
      p("You can input your own values then click the button for prediction."),
      textInput("sepal_Length","Sepal Length"),
      textInput("sepal_Width","Sepal Width"),
      textInput("pepal_Length","Pepal Length"),
      textInput("pepal_Width","Pepal Width"),
      actionButton("predict", "Predict")
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
      
      # Output: Plot of the requested variable against mpg ----
      plotOutput("irisPlot")
      
    )
  )
)