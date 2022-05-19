
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
      transpose,compact = F,
      fullWidth = T,
      columns = list(
        .rownames = colDef(minWidth = 300)),
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
  
  
  
  
  # avg<-data.frame(
  #   stringsAsFactors = FALSE,
  #   rowname = c("HO","HO","HO","RI",
  #               "RI","RI","QR","QR","QR","LS","LS","LS","CL","CL",
  #               "CL","SF","SF","SF","ET","ET","ET","QI","QI",
  #               "QI","SE","SE","SE"),
  #   name = c("PGT","Y1","YF","PGT",
  #            "Y1","YF","PGT","Y1","YF","PGT","Y1","YF","PGT",
  #            "Y1","YF","PGT","Y1","YF","PGT","Y1","YF",
  #            "PGT","Y1","YF","PGT","Y1","YF"),
  #   value2 = c(30.58333,29.6,28.23077,
  #              16.3081,17.944,15.63492,32.551,34.82828,
  #              33,45.034014,37.626263,32.537634,24.4118,
  #              15.40845,34.29167,13.25,8.695,10.193548,46.361702,
  #              30.09677,38.38462,30.15789,28.5,37.9,
  #              18.94595,24.90012,18.94595)
  # )
  # 
  avg<- data.frame(
    stringsAsFactors = FALSE,
    rowname = c("HO", "RI", "QR", "LS", "CL", "SF", "ET", "QI", "SE"),
    PGT = c(38.6, 33.9, 21.6, 34.4, 24.6, 12.3, 34.7, 31.7, 23.2),
    YF = c(34.1, 30.2, 20.3, 30.4, 28.8, 12.2, 30.6, 30.3, 23.5),
    Y1 = c(33.5, 28.6, 17.5, 30.6, 23.6, 8.1, 32.9, 29.5, 24.8)
  )
  avg<-avg %>% gather(key="name",value="value2", -rowname)
  
  
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


#-------------Radarchart--------

output$radarplot <- renderPlot({
  if(is.null(input$inSelect)==T ) Data=df()
  else Data= df() %>%  filter(CourseNm %in% input$inSelect )
  
  
  
  df3<-Data %>%  select( "HO","RI","QR","LS","CL","SF","ET","QI","SE") %>%  dplyr::summarise(across(1:9,~ mean(.x, na.rm = TRUE)))
  #df3<-column_to_rownames(df3, "study_group")
  #avg<-spread(avg,rowname, value2) %>%select(-name)%>% summarise_all(mean)%>% round(0)
  
  
  
  
  avg<-  data.frame(
    HO = c(34.7),
    RI = c(30.2),
    QR = c(19.2),
    LS = c(31.3),
    CL = c(25.4),
    SF = c(10.2),
    ET = c(32.5),
    QI = c(30.2),
    SE = c(24.1)
  )
  
  df3<-data.frame(rbind(rep(60, 8), rep(0, 8),avg,
                        df3 ))%>% round(0)
  print(df3)
  names(df3)<- c(
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
  
  # Produce a radar-chart
  radarchart(
    df3,
    pfcol = c("#99999980",NA),
    pcol= c(NA,2), plty = 1, plwd = 2,
    axistype = 4,
    title = "Institutional profile", caxislabels = c(0,15, 30, 45, 60),
    axislabcol = "black"
  )
  legend(
    x = "bottom", legend = c("Nat. Average","Institution"), horiz = T,
    bty = "n", pch = 20 , col = c("Grey", "Red"),
    text.col = "black", cex = 1, pt.cex = 1.5
  )
  
  
})







