library(shiny)
library(zoo)

shinyUI(
  pageWithSidebar(
    headerPanel("Credit Bank Portfolio Analysis"),
    
    sidebarPanel(tags$head(tags$style("body {background-color: antiquewhite;}")),
      HTML('<style type="text/css">.span4 .well { background-color: #EEDFCC; }</style>'), 
      dateInput('yearmonth', 'Month plot date:', value = '2014-05', min = '2013-05',
                max = '2014-05', format = 'yyyy-mm',weekstart = 0, language = "en"),
     # numericInput('startdate','Yearmonth range start',201305,min=201305,max=201405),
      #numericInput('enddate','Yearmonth range end',201405,min=201305,max=201405),
      #numericInput('yearmonth','Month plot date',201405,min=201305,max=201405)
      #submitButton('Submit')
     p(),
     p(),
     div('This graph is about a credit bank portfolio and the monthly payment performance of the assigned debt to debt collection agencies compared to the performance of the unassigned. The graph shows this performance comaprison. By changing the month and year of the above date, you can see the performance for the corresponding month and year on the chart.'),
     div('--------------------------------------------------------------------------'),
     p(),
     div('DCA : Debt Collection Agency'),
     div('PAY_RATIO : The percentage of assigned client payments to the assigned debt monthly'),
     div('Unassigned : The unassigned segment of the bank porfolio. Cases that are not assigned to a DCA for debt collection')
      ),
    mainPanel(
      h3('Payments table'),
      plotOutput('newHist')
      #h4('Payments, Accounting and debt amount assigned on each DCA per month'),
      #verbatimTextOutput("inputValue")
      
        )
      )
    )
