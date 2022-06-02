library(bslib)
library(shiny)
library(reactable)
library(tidyverse)
library(readxl)
library(likert)
library(naniar)
library(shinycssloaders)
library(waiter)
library(fmsb)
library(markdown)
library(shinyalert)
library(shinyWidgets)
library(data.table)
library(reactable)
library(gt)
library(ggraph)
library(igraph)
library(tidytext)
library(stringr)
library(corrplot)
library(grid)


df<-NULL
source('functions.R', local = TRUE)
shinyServer(function(input, output, session) {
    # Data<-df
    hideTab(inputId = "tabs", target = "Supportive Environment")
    hideTab(inputId = "tabs", target = "Quantitative Reasoning")
    hideTab(inputId = "tabs", target = "Quality of Interactions")
    
    
    df <- reactive({ 
        req(input$file1)
        read_excel(input$file1$datapath, sheet = "Data")
    })
    
    #-------------- Logging for troubleshooting--------------
    observe({
        print(input$file1)
    })
    observe({
        
        print(input$inSelect)
    })
    observe({
        print("N-grams:")
        print(input$obs)
    })
    
    
    
    #-------------- end --------------
    
    
    
    observeEvent(input$file1, {
        names<-df() %>% group_by(CourseNm) %>% tally() %>% filter(n>20) %>%  select(CourseNm)
        
        # names <- unique(df()$CourseNm)        
        # Method 1
        updatePickerInput(session = session, inputId = "inSelect",
                          choices = names)
    }, ignoreInit = TRUE)
    
    
    
    
    output$contents <- renderReactable({
        req(input$file1)
        tryCatch(
            {
                #browser()
                #df <-  read_excel(input$file1$datapath, sheet = "Data")
                showTab(inputId = "tabs", target = "Supportive Environment")
                showTab(inputId = "tabs", target = "Quantitative Reasoning")
                showTab(inputId = "tabs", target = "Quality of Interactions")
                if(is.null(input$inSelect)==T ) Data=df()
                else Data= df() %>%  filter(CourseNm %in% input$inSelect )
                Data %>% group_by(study_group) %>% dplyr::summarise(n=n()) %>% 
                    reactable()
            },
            error = function(e) {
                # return a safeError if a parsing error occurs
                stop(safeError(e))
            }
        )
        
    })
    
    
    output$contents2 <- renderReactable({
        if(is.null(input$inSelect)==T ) Data=df()
        else Data= df() %>%  dplyr::filter(CourseNm %in% input$inSelect )
        Data %>% tally() %>% reactable() 
        
    })
    
    
    
    
    
    
    #DOWNLOAD HANDLER   
    source('download_handler.R', local = TRUE)
    
    #Do an if and look for null in path and only load once the path is there
    # reactive(  
    #if (is.null(df)) {
    # }else   {
    #----------High Level Indicators-----------
    source('High_level_Indicators.R', local = TRUE)
    
    #--------Supportive Environment--------
    source('Supportive_environment.R', local = TRUE)
    #--------Quantitative Reasoning--------
    source('Quantitative_reasoning.R', local = TRUE)    
    #--------Quality of interactions--------
    source('Quality_of_interactions.R', local = TRUE)    
    #})
    
    
    
    
    
    
    
    
})
