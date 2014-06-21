library(shiny)
library(UsingR)
library(lattice)
library(zoo)
library(plotrix)
payments<- read.csv("payments1.csv", header=T)
shinyServer(
  function(input,output){
    x <- reactive({as.yearmon(input$yearmonth)})
    #output$inputValue<-renderPrint({subset(payments,REF_DATE>=input$startdate & REF_DATE<=input$enddate)})
    output$newHist<-renderPlot({
      barchart(PAY_RATIO ~ EXTC_NAME, subset(payments,as.yearmon(REF_DATE)>=x() & as.yearmon(REF_DATE)<=x()),col='forestgreen')
      mytable<-subset(payments,as.yearmon(REF_DATE)==x())
      lbls <- c("DCA1","DCA2","DCA3", "DCA4", "Unassigned")
      pie3D(mytable$DEBT_AMOUNT,labels=lbls,explode=0.2,main="Pie Chart of Portfolio Debt",radius=0.9,theta=pi/3)
    })
  }
)

