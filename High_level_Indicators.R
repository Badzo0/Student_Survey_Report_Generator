
observe({
output$table1 <- renderReactable({
  req(!is.null(df()))
  #browser()
  if(is.null(input$inSelect)==T ) Data=df()
  else Data= df() %>%  filter(CourseNm %in% input$inSelect )
  print(input$file1$name)
    
    
    
    
    
    
  High_level<-Data %>% dplyr::group_by(study_group) %>% dplyr::select(study_group, "HO","RI","QR","LS","CL","SF","ET","QI","SE") %>%   dplyr::summarise(across(1:9,~ mean(.x, na.rm = TRUE)))
  names(High_level)<- c(
    study_group="study_group",
    HO="Higher-Order Learning",
    RI="Reflective and Integrative Learning",
    QR="Quantitative Reasoning",
    LS="Learning Strategies",
    CL="Collaborative Learning",
    SF="Student-Faculty Interaction",
    ET="Effective Teaching Practices",
    QI="Quality of Interactions",
    SE="Supportive Environment"
  )
  High_level<-as.data.frame(High_level)
  rownames(High_level) <- High_level$study_group
  High_level$study_group <- NULL
  transpose <- as.data.frame(t(as.matrix(High_level)))
  #transpose <- transpose(High_level)
  #Color function
  BuYlRd <- function(x) rgb(colorRamp(c("#eb5528", "#ffffbf", "#42a145"))(x), maxColorValue = 255)
  #Create a table
  reactable(
    transpose,compact = TRUE,
    defaultColDef = colDef(
      style = function(value) {
        if (!is.numeric(value)) return()
        normalized <- (value - min(transpose[1:length(transpose)])) / (max(transpose[1:length(transpose)]) - min(transpose[1:length(transpose)]))
        color <- BuYlRd(normalized)
        list(background = color)
      },
      format = colFormat(percent = F, digits = 1),
      minWidth = 50
    )
  )
})
})



output$plot12 <- renderPlot({
  if(is.null(input$inSelect)==T ) Data=df()
  else Data= df() %>%  filter(CourseNm %in% input$inSelect )
  
  
  High_level<-Data %>%  select(study_group, "HO","RI","QR","LS","CL","SF","ET","QI","SE") %>% group_by(study_group) %>%  dplyr::summarise(across(1:9,~ mean(.x, na.rm = TRUE)))
  
  
  
  
  #put into percentages
  #f <- function(x) x/100
  #High_level[-1] <- sapply(High_level[-1], function(x) round(f(x), 2))
  
  
  #Transpose
  High_level<-as.data.frame(High_level)
  rownames(High_level) <- High_level$study_group
  High_level$study_group <- NULL
  transpose <- as.data.frame(t(as.matrix(High_level)))
  #transpose <- transpose(High_level)
  rownames(transpose) <- colnames(High_level)
  colnames(transpose) <- rownames(High_level)
  
  
  #Color function
  BuYlRd <- function(x) rgb(colorRamp(c("#eb5528", "#ffffbf", "#42a145"))(x), maxColorValue = 255)

  
  
  transpose
  transpose<-transpose %>% rownames_to_column() %>% 
    pivot_longer(.,names(transpose))
  

  
  
  avg<-data.frame(
    stringsAsFactors = FALSE,
    rowname = c("HO","HO","HO","RI",
                "RI","RI","QR","QR","QR","LS","LS","LS","CL","CL",
                "CL","SF","SF","SF","ET","ET","ET","QI","QI",
                "QI","SE","SE","SE"),
    name = c("PGT","Y1","YF","PGT",
             "Y1","YF","PGT","Y1","YF","PGT","Y1","YF","PGT",
             "Y1","YF","PGT","Y1","YF","PGT","Y1","YF",
             "PGT","Y1","YF","PGT","Y1","YF"),
    value2 = c(30.58333,29.6,28.23077,
               16.3081,17.944,15.63492,32.551,34.82828,
               33,45.034014,37.626263,32.537634,24.4118,
               15.40845,34.29167,13.25,8.695,10.193548,46.361702,
               30.09677,38.38462,30.15789,28.5,37.9,
               18.94595,24.90012,18.94595)
  )
  
  
  
  transpose<-merge(x = transpose, y = avg, by = c("rowname","name"), all.x = TRUE)
  
  
  
  options(scipen=999)
  
  transpose<-transpose %>% mutate(diff=value-value2)
  
  transpose$rowname<-recode_factor(transpose$rowname,
                                   HO="Higher-Order Learning",
                                   RI="Reflective and Integrative Learning",
                                   QR="Quantitative Reasoning",
                                   LS="Learning Strategies",
                                   CL="Collaborative Learning",
                                   SF="Student-Faculty Interaction",
                                   ET="Effective Teaching Practices",
                                   QI="Quality of Interactions",
                                   SE="Supportive Environment"
  )
  
  ggplot(transpose,aes(x=factor(rowname), y=diff, fill=name))+ geom_bar( stat='identity', position=position_dodge())+
    theme_bw()+  xlab("Indicators")+
    theme(axis.text.x=element_text(angle=45, hjust=1, size=10))+
    geom_text(aes(label=sprintf("%2.1f", diff)), angle=90,position = position_dodge(width = .9),size=3)+ggtitle("Difference from national Average")+
    geom_hline(yintercept=0)+
    scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))
})

