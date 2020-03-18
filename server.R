
library(shiny)
library(e1071)

df <- as.data.frame(read.csv('https://raw.githubusercontent.com/danielcaraway/data/master/ist718_finalproject_four_columns_2.csv'))
df2 <- as.data.frame(read.csv('https://raw.githubusercontent.com/danielcaraway/data/master/ist718_finalproject_export_freq_all.csv'))
mod <- naiveBayes(TARGET ~ ., data = df)

shinyServer( function(input, output) {
  print(input)
  output$plot1 <- renderPlot({
  
    selectedData <- df2[df2$INCOME==input$cl & df2$SEX==input$se & df2$AGE==input$ag,5]
    bplt <- barplot(selectedData,
                    beside=TRUE, horiz=TRUE, xlim=c(0,30000),
                    main="Home Credit Loans based on an applicant's attributes",
                    ylab="Total",
                    col=c("black", "grey"),
                    legend = c("Trouble Repaying", "Repaid")
    )
    text(x=selectedData+20,
         y=bplt,
         labels=as.character(selectedData),
         xpd=TRUE)
  })
  output$result <- renderText({ 
    r <- predict(mod, df[df$INCOME==input$cl & df$SEX==input$se & df$AGE==input$ag & df$TARGET=="repaid",1:4])
    as.character(r[1])
  })
})