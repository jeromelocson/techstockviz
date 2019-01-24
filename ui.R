#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Top 5 Tech Companies - Stocks Visualization"),
  br(),
  br(),
  sidebarLayout(
    sidebarPanel(
      
      selectInput("symb", "Select Tech Company:",
                  c("Facebook" = "FB",
                    "Google" = "GOOG",
                    "Amazon" = "AMZN",
                    "Netflix" = "NFLX",
                    "Microsoft" = "MSFT")),
      dateRangeInput("dates", 
                     "Date range",
                     start = "2018-01-01", 
                     end = as.character(Sys.Date())),
      
      h3("How to use this app:"),
      
      tags$ul(
        tags$li("Select a stock to examine from the dropdown above. It will dynamically refresh in the right side.
                If 404 error occurs, please reselect another ticker or refresh the page.
                Information will be collected from Yahoo finance - https://finance.yahoo.com/."),
        tags$li("Now, select the date range on which you want to explore both the stock volume and the price performances below. If you want to look closer, please select closer dates."),
        tags$li(tags$a(href="https://www.youtube.com/embed/1rwVV_8uUxc", "Click here to learn on how to read the candlestick chart.")),
        tags$li(tags$a(href="https://github.com/jeromelocson/techstockviz", "View code at Github."))
      )
      
    ),
    
    mainPanel(plotOutput("plot"))
    
)))
