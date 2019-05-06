# Define UI for app ----
ui <- fluidPage(
  
  setBackgroundColor(
    color = c("#F7FBFF", "#e6e6fa"),
    gradient = "linear",
    direction = "bottom"
  ),
  
  # App title ----
  titlePanel("Technical Pricing Dashboard"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      textInput("text1", label = h4("NAICS Code"), value = "Enter NAICS Code"),
      textInput("text2", label = h4("Revenue"), value = "Enter Company Revenue"),
      selectInput("select1", label = h4("Territory"), 
                  choices = list("Select Territory" = 1,"Territory 1" = 2, "Territory 2" = 3, "Territory 3" = 4, "Territory 4" = 5), 
                  selected = 1),
      radioButtons("radio1", label = h3("Prior Insurance?"),
                   choices = list("Yes" = 1, "No" = 2), 
                   selected = 1),
      
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Box Plot ----
      h4("Summary of Key Risk Characteristics"),
      plotOutput(outputId = "boxplot")
      
    )
  )
)