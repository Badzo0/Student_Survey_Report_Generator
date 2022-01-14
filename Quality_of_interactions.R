


output$QI_1 <- renderPlot({
  if(is.null(input$inSelect)==T ) Data=df()
  else Data= df() %>%  filter(CourseNm %in% input$inSelect )
  
  df<-Data
  QI_items <- df %>%
    dplyr::select( "Qistudent","Qiadvisor","Qifaculty","Qistaff","Qiadmin") 
  names(QI_items) <- c(
    Qistudent="Students (At your institution, please indicate the quality of interactions with:)",
    Qiadvisor="Academic advisors",
    Qifaculty="Academic staff",
    Qistaff="Support services staff (career services, student activities, accommodation, etc.)",
    Qiadmin="Other administrative staff and offices (registry, finance, etc.)")
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  QI_items_likert <-as.data.frame(QI_items) %>% 
    mutate_all(likert_recode) 
  QI_items_likert_1 <-as.data.frame(QI_items) %>% 
    mutate_all(likert_recode) %>% likert()
  ##### Group by Country
  aqi <- likert(QI_items_likert, grouping=df$study_group)
  
  
  
  
  plot(QI_items_likert_1, 
       # Group the items alphabetically
       group.order=names(QI_items),
       plot.percent.low = FALSE,
       legend.position = "right",
       #legend = "",
       plot.percent.high = FALSE,
       plot.percents=TRUE) 
},width = 800)


output$QI_2 <- renderPlot({
  if(is.null(input$inSelect)==T ) Data=df()
  else Data= df() %>%  filter(CourseNm %in% input$inSelect )
  df<-Data
  QI_items <- df %>%
    dplyr::select( "Qistudent","Qiadvisor","Qifaculty","Qistaff","Qiadmin") 
  names(QI_items) <- c(
    Qistudent="Students (At your institution, please indicate the quality of interactions with:)",
    Qiadvisor="Academic advisors",
    Qifaculty="Academic staff",
    Qistaff="Support services staff (career services, student activities, accommodation, etc.)",
    Qiadmin="Other administrative staff and offices (registry, finance, etc.)")
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  QI_items_likert <-as.data.frame(QI_items) %>% 
    mutate_all(likert_recode) 
  QI_items_likert_1 <-as.data.frame(QI_items) %>% 
    mutate_all(likert_recode) %>% likert()
  ##### Group by Country
  aqi <- likert(QI_items_likert, grouping=df$study_group)
  
  
  
  
  plot(aqi,include.histogram=TRUE,wrap=200)
},width = 700)


output$QI_3 <- renderPlot({
  if(is.null(input$inSelect)==T ) Data=df()
  else Data= df() %>%  filter(CourseNm %in% input$inSelect )
  df<-Data
  QI_items <- df %>%
    dplyr::select( "Qistudent","Qiadvisor","Qifaculty","Qistaff","Qiadmin") 
  names(QI_items) <- c(
    Qistudent="Students (At your institution, please indicate the quality of interactions with:)",
    Qiadvisor="Academic advisors",
    Qifaculty="Academic staff",
    Qistaff="Support services staff (career services, student activities, accommodation, etc.)",
    Qiadmin="Other administrative staff and offices (registry, finance, etc.)")
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  QI_items_likert <-as.data.frame(QI_items) %>% 
    mutate_all(likert_recode) 
  QI_items_likert_1 <-as.data.frame(QI_items) %>% 
    mutate_all(likert_recode) %>% likert()
  ##### Group by Country
  aqi <- likert(QI_items_likert, grouping=df$study_group)
  
  
  
  
  a112 <- likert(QI_items_likert, grouping=df$AcUnit1)
  plot(a112,include.histogram=TRUE,wrap=200)
},width = 700)

output$QI_4 <- renderPlot({
  if(is.null(input$inSelect)==T ) Data=df()
  else Data= df() %>%  filter(CourseNm %in% input$inSelect )
  df<-Data
  QI_items <- df %>%
    dplyr::select( "Qistudent","Qiadvisor","Qifaculty","Qistaff","Qiadmin") 
  names(QI_items) <- c(
    Qistudent="Students (At your institution, please indicate the quality of interactions with:)",
    Qiadvisor="Academic advisors",
    Qifaculty="Academic staff",
    Qistaff="Support services staff (career services, student activities, accommodation, etc.)",
    Qiadmin="Other administrative staff and offices (registry, finance, etc.)")
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  QI_items_likert <-as.data.frame(QI_items) %>% 
    mutate_all(likert_recode) 
  QI_items_likert_1 <-as.data.frame(QI_items) %>% 
    mutate_all(likert_recode) %>% likert()
  ##### Group by Country
  aqi <- likert(QI_items_likert, grouping=df$study_group)
  
  
  
  
  df %>%
    dplyr::select( "Seacademic","Selearnsup","Sediverse","Sesocial","Sewellness","Senonacad","Seactivities","Seevents") %>% 
    gg_miss_upset(., nsets = 10)
},width = 700, )





