library(shiny)
library(AppliedPredictiveModeling)
data(abalone)

#
# Function used to predict the age of abalone using type, diameter, height and wholeweight
#
abaloneAge <- function(type, diameter, height, wholeweight) {
  # build the linear regression model
  model <- lm (Rings ~ Type + WholeWeight + Diameter + Height, data=abalone)
  
  # use default
  #new <- data.frame(factor('M'),0.455,0.365,0.2,0.09,0.5,0.2,0.1,0.15)
  #colnames(new)=c('Type','LongestShell','Diameter','Height','WholeWeight','ShuckedWeight','VisceraWeight','ShellWeight')
  newD <- data.frame(factor('M'),0,0,0)
  colnames(newD)=c('Type','Diameter','Height','WholeWeight')
  newD$Type=factor(type)
  newD$Height=height
  newD$Diameter=diameter
  newD$WholeWeight=wholeweight
  predict(model, newD)

}

#
# Shiny server portion
#
shinyServer(
  function(input, output) {
    output$inputType <- renderText(input$type)
    output$inputDiameter <- renderText(input$diameter)
    output$inputHeight <- renderText(input$height)
    output$inputWholeWeight <- renderText(input$wholeweight)
    output$prediction <- renderText(abaloneAge(input$type,input$diameter,input$height,input$wholeweight))
  }
)
