
library(shiny)
library(e1071)

df <- as.data.frame(read.csv('https://raw.githubusercontent.com/danielcaraway/data/master/ist718_finalproject_four_columns_2.csv'))

shinyUI( pageWithSidebar(
  headerPanel( "Naive Bayes Classifier applied to Home Credit dataset"),
  sidebarPanel(
    h4("Home Credit applicants's attributes:"),
    br(),
    selectInput( "cl", "Income Bracket", levels(df[1,1]), "above 200k"),
    selectInput( "ag", "Age", levels(df[1,2]), "young"),
    selectInput( "se", "Sex", levels(df[1,4]), "M"),
    br(),
    h4("Naive Bayes associated prediction:"),
    br(),
    h5("Approve ?"),
    textOutput("result")
  ),
  mainPanel(
    h3("Home Credit data set"),
    p("Founded in 1997, Home Credit is an international consumer finance provider with operations in 9 countries. They focus on responsible lending primarily to people with little or no credit history. "),
    h3("Naive Bayes prediction"),
    p("Based on this data set this ShinyApp uses a Naive Bayes classifier prediction model and display the associated stats numbers based on an applicant's attributes"),
    plotOutput('plot1')
  )
))