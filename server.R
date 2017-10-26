irisData <- iris

library(caret)
train<-createDataPartition(iris$Species, p=0.6, list=F)
trainset<-iris[train,]
testset<-iris[-train,]

library(randomForest)
set.seed(2)
model_rf<-randomForest(Species~., data=trainset)


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
  observeEvent(input$predict, {
      showModal(modalDialog(
        title = "Prediction",
        as.character(
          predict(
            model_rf, 
            data.frame(
              Sepal.Length=as.numeric(input$sepal_Length), 
              Sepal.Width=as.numeric(input$sepal_Width), 
              Petal.Length=as.numeric(input$pepal_Length), 
              Petal.Width=as.numeric(input$pepal_Width)
            )
          )
        )      
      ))
  })
  
  output$irisPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = irisData,
            outline = input$outliers)
  })  
}