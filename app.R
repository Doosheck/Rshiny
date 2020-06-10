library(shiny)
library(rsconnect)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("darkly"),
  titlePanel("Dane kontaktowe"),
  sidebarLayout(
    sidebarPanel(
      textInput("mojTekstInput", h3("Imię i nazwisko:")),
      numericInput("mojNumerInput", h3("Wiek:"),
                   value = 50, min = 0, max = 100, step = 1),
      selectInput("select", h3("Płeć:"), 
                  choices = list("Mężczyzna" = "Mężczyzna", "Kobieta" = "Kobieta",
                                 "Inna" = "Inna"), selected = 1)),
  
    mainPanel(
      h3("Sprawdź ponownie wpisane dane"),
      strong(textOutput("wyjsciowyTekst")),
      strong(textOutput("wyjsciowyNumer")),
      strong(textOutput("wyjsciowaPlec"))
    )
  )
  )

server <- function(input, output) {
  output$wyjsciowyTekst <- renderText(paste("Imię i nazwisko: ", input$mojTekstInput))
  output$wyjsciowyNumer <- renderText(paste("Wiek: ", input$mojNumerInput))
  output$wyjsciowaPlec <- renderText(paste("Płeć: ", input$select))
}

shinyApp(ui, server)
