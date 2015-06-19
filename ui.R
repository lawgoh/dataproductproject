library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Abalone Age (rings) prediction"),
    sidebarPanel(
      h5('This is an Abalone Age prediction based on user inputs (type, diameter, height, weight) using a linear model based on the abalone data set from the AppliedPredictiveModeling R package. '),
      em('Please input the values on the left and the output prediction is Rings Prediction (Age) shown on the right.'),
      h3('Input for Abalone Age Prediction'),
      selectInput("type", 
                  label = "Choose type of Abalone",
                  choices = c("M", "F", "I"),
                  selected = "M"),
      h5('Note: M=Male, F=Female, I=Infant'),
      #numericInput('diameter', 'Diameter perpendicular to length (mm)', 0.08, min = 0.01, max = 1, step = 0.001),
      sliderInput("diameter", 
                  label = "Diameter perpendicular to length (mm):",
                  min = 0.01, max = 1, value = 0.08, step=0.001),
      #numericInput('height', 'Height with meat in shell (mm)', 0.3, min = 0.01, max = 1.5, step = 0.001),
      sliderInput("height", 
                  label = "Height with meat in shell (mm):",
                  min = 0.01, max = 2, value = 0.3, step=0.001),
      #numericInput('wholeweight', 'Whole Weight (gram)', 0.29, min = 0.0020, max = 5, step = 0.001),
      sliderInput("wholeweight", 
                  label = "Whole Weight (gram):",
                  min = 0.0020, max = 5, value = 0.29, step=0.001),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Your Input and Age Prediction through Linear Regression Modelling'),
      h5('Linear model using abalone Type, Diameter, Height and whole weight'),
      h4('Type of Abalone'),
      verbatimTextOutput("inputType"),
      h4('Diameter (mm)'),
      verbatimTextOutput("inputDiameter"),
      h4('Height (mm)'),
      verbatimTextOutput("inputHeight"),
      h4('Whole Weight (gram)'),
      verbatimTextOutput("inputWholeWeight"),
      h3('Rings (Age) prediction '),
      verbatimTextOutput("prediction")
    )
  )
)
