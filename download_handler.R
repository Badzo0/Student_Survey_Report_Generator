waitress <- Waitress$new("nav",theme = "line", infinite = TRUE)

Waitress$new("#plot")$auto(20, 2000)
#creates report link from dropdown selection
reportname <- reactive({ 
  reportname<- paste0(input$selectreport,".Rmd")
})
#Download handler

ending <- reactive({ 
  if (input$selectreport =="Student_Survey_2021_Indicators") ending<-".html"
  else if(input$selectreport =="Student_Survey_2022")ending<-".html"
  else{ending <-".html"}
})

parameters <- reactive({ 
  if (input$selectreport =="Student_Survey_2021_Indicators") {
    list(n = input$file1$datapath,
         obs=input$obs)}else if(input$selectreport =="Student_Survey_2022"){list(n = input$file1$datapath,
                                                                                 obs=input$obs,
                                                                                 avgr=input$seleccompare)}else{
                                                                                   list(n = input$file1$datapath,
                                                                                        course=input$inSelect)}
})

filename <- reactive({ 
  filename<-paste0(input$selectreport , ending())
})

observe({
  print(paste0("ending:",ending()))
  print(paste0("parameters:", parameters()))
  print(paste0("filename:", filename()))
  
})

output$report <- downloadHandler(
  
  
  
  
  # For PDF output, change this to "report.pdf"
  filename =function() filename(),
  content = function(file) {
    # Copy the report file to a temporary directory before processing it, in
    # case we don't have write permissions to the current working dir (which
    # can happen when deployed).
    tempReport <- file.path(tempdir(), reportname())
    file.copy(reportname(), tempReport, overwrite = TRUE)
    tempReport2 <- file.path(tempdir(), "logo1.png")
    file.copy("logo1.png", tempReport2, overwrite = TRUE)
    tempReport2 <- file.path(tempdir(), "img7.png")
    file.copy("img7.png", tempReport2, overwrite = TRUE)
    tempReport2 <- file.path(tempdir(), "img8.png")
    file.copy("img8.png", tempReport2, overwrite = TRUE)
    # Set up parameters to pass to Rmd document
    params <- parameters()
    
    # Knit the document, passing in the `params` list, and eval it in a
    # child of the global environment (this isolates the code in the document
    # from the code in this app).
    waitress$start()
    
    
    
    #-------------- Error handling-------------
    
    
    tryCatch({
      return( if(input$inSelect=="" && input$selectreport=="Course_report"){stop("throw error")}else{        rmarkdown::render(tempReport, output_file = file,
                                                                                                                               params = params,
                                                                                                                               envir = new.env(parent = globalenv())
      )
        waitress$close() # hide when done
      }
      
      
      
      )
      
    },
    error = function(e) {
      message('No data in chosen Analysis.', e)
      showModal(
        modalDialog(
          title="Error in generating report",
          div("Looks like a course was not selected which prevents Course_report from generating
                "),
          div("Error Details:"),
          div(paste("Selected report:",input$selectreport)),
          div(paste("Selected course:",input$inSelect))
          ,easyClose = TRUE,
          fade = T)
      )
      return(NULL)
    }
    )
    
    
    
    #-------------- end --------------
    
    
    waitress$close() # hide when done
    
  }
)
