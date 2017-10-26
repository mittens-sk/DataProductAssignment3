library(shiny)

ui <- pageWithSidebar(
  
  # App title ----
  headerPanel("Species Characteristic"),
  
  # Sidebar panel for inputs ----
  sidebarPanel(),
  
  # Main panel for displaying outputs ----
  mainPanel()
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
}

shinyApp(ui, server)


