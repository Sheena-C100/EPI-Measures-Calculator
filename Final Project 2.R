install.packages("shiny", type = "binary")
library(shiny)
install.packages("htmltools")
install.packages("shinythemes")
library(shinythemes)



ui <- navbarPage(
  title =  "Calculating Rate Ratio and Odds Ratio",
  theme = shinytheme("cerulean"),
  
  tabPanel("Rate Ratio",
           sidebarLayout(
             sidebarPanel(
               tags$h3("Variables:"),
               numericInput("A0","A\u2080:",0),
               numericInput("N0","N\u2080:",0),
               
               tags$h3("Equation:"),
               textOutput("RateRatioEquation"),
               
             ),
           mainPanel(
             tags$h3("Result:"),
             textOutput("RateRatioResult")
           ))
           ),
  tabPanel("Odds Ratio",
           sidebarLayout(
             sidebarPanel(
               tags$h3("Variables:"),
               numericInput("A1","A\u2081:",0),
               numericInput("OR_A0","A\u2080:",0),
               numericInput("B0","B\u2080:",0),
               numericInput("B1","B\u2081:",0),
               
               tags$h3("Equation:"),
               textOutput("OddsRatioEquation")
               
           ),
           mainPanel(
             tags$h3("Result:"),
             textOutput("OddsRatioResult")
           )
          )
  )
)

server <- function(input, output, session) {
  
  output$RateRatioEquation <- renderText({
    "Rate Ratio Formula: A\u2080 / N\u2080"
  })
  
  output$RateRatioResult <- renderText({
    if(input$N0 == 0){
      "Can not Divide by Zero!"
    } else {
      rr <- input$A0 / input$N0
      paste("Rate Ratio = ",round(rr,3))
    }
  })
  output$OddsRatioEquation <- renderText({
    "Odds Ratio Formula: (A\u2081 * B\u2080) / (A\u2080 * B\u2081)"})
  
  output$OddsRatioResult <- renderText({
    if(input$OR_A0 == 0|| input$B1 == 0){
      "Can not Divide by Zero!"
    } else {
      or <- (input$A1 * input$B0) / (input$OR_A0 * input$B1)
      paste("Odds Ratio =", round(or,3))
    }
  })
}

shinyApp(ui = ui, server = server)
  
  
  


















