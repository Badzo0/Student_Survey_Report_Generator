library(bslib)
library(shiny)
library(reactable)
library(tidyverse)
library(readxl)
library(likert)
library(plyr)
library(naniar)
library(shinycssloaders)
library(waiter)
library(shinyWidgets)


shinyUI(tagList(
  tags$head(
    tags$style(HTML(
      "html {
             position: relative;
             min-height: 100%;
           }
           body {
             margin-bottom: 20px; /* Margin bottom by footer height */
           }
           .footer {
             position: absolute;
             bottom: 0;
             width: 100%;
             font-size: 10px;
             height: 20px; /* Set the fixed height of the footer here */
             background-color: #ffffff;
             color: #bdbebf;
           }"))),
  navbarPage("Indicator Analysis",id = "tabs",
                   theme = bs_theme(bootswatch = "minty",  secondary = "#F4DD77"),
                   tabPanel("Import Data",
                            titlePanel("Importing StudentSurvey.Ie Data File"),
                            fileInput("file1", "Choose Excel File",
                                      multiple = T,
                                      accept = c(".xlsx")),
                            
                            useWaitress(color = "#F4DD77"),
                            pickerInput("inSelect", "Select input",
                                        c(""), options = list(`actions-box` = TRUE,liveSearch =T),multiple = T),
                            numericInput("obs", "Number of N-grams (Qualitative):", 4, min = 1, max = 50),
                            downloadButton("report", "Download Report"),
                            

                            # Horizontal line ----
                            tags$hr(),
                            reactableOutput("contents"),
                            tags$br(),
                            reactableOutput("contents2"),
                            tags$br(),tags$br(),tags$br(),
                            #tags$hr(),
                            plotOutput("radarplot", height = "600px" ),
                            tags$br(),
                            reactableOutput("table1"),
                            tags$br(),
                            plotOutput("plot12"),
                            tags$br(),
                            tags$br()
      
                   ),
                   tabPanel("Supportive Environment",
                            includeMarkdown("text/SE.Rmd"),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("SE_1"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                            tags$hr(),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("SE_2"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                            tags$hr(),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("SE_3"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                            tags$hr(),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("SE_4"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                   ),
                   tabPanel("Quantitative Reasoning",
                            includeMarkdown("text/QR.Rmd"),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("QR_1"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                            tags$hr(),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("QR_2"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                            tags$hr(),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("QR_3"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                            tags$hr(),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("QR_4"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                   ),
                   tabPanel("Quality of Interactions",
                            includeMarkdown("text/QI.Rmd"),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("QI_1"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                            tags$hr(),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("QI_2"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                            tags$hr(),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("QI_3"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                            tags$hr(),
                            fluidRow(column(10, align="center",shinycssloaders::withSpinner(plotOutput("QI_4"),type = 3,color.background="#FFFFFF", color = "#F4DD77"))),
                   ),
                   tags$footer("More information on: https://github.com/Badzo0/StudentSurvey_Reporter", class = "footer"))
                   
)
)