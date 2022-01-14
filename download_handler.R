waitress <- Waitress$new("nav",theme = "line", infinite = TRUE)

Waitress$new("#plot")$auto(20, 2000)

output$report <- downloadHandler(
  # For PDF output, change this to "report.pdf"
  filename = "report.html",
  content = function(file) {
    # Copy the report file to a temporary directory before processing it, in
    # case we don't have write permissions to the current working dir (which
    # can happen when deployed).
    tempReport <- file.path(tempdir(), "Student_Survey_2021_Indicators.Rmd")
    file.copy("Student_Survey_2021_Indicators.Rmd", tempReport, overwrite = TRUE)
    # Set up parameters to pass to Rmd document
    params <- list(n = input$file1$datapath,
                   obs=input$obs)
    # Knit the document, passing in the `params` list, and eval it in a
    # child of the global environment (this isolates the code in the document
    # from the code in this app).
    waitress$start()
    
    rmarkdown::render(tempReport, output_file = file,
                      params = params,
                      envir = new.env(parent = globalenv())
    )

    waitress$close() # hide when done
    
  }
)
