output$QR_1 <- renderPlot({
  
  df<-df()
  QR_items <- df %>%
    select( "Qrconclude",  "Qrproblem",   "Qrevaluate") 
  names(QR_items) <- c(
    Qrconclude="Reached conclusions based on your analysis of numerical information (numbers, graphs, statistics, etc.) (During the current academic year, about how often have you:)",
    Qrproblem="Used numerical information to examine a real-world problem or issue (unemployment, climate change, public health, etc.)",
    Qrevaluate="Evaluated what others have concluded from numerical information")
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  QR_items_likert <-as.data.frame(QR_items) %>% 
    mutate_all(likert_recode_4) 
  QR_items_likert_1 <-as.data.frame(QR_items) %>% 
    mutate_all(likert_recode_4) %>% likert()
  ##### Group by Country
  aqr <- likert(QR_items_likert, grouping=df$study_group)
  
  
  plot(QR_items_likert_1, 
       # Group the items alphabetically
       group.order=names(QR_items),
       plot.percent.low = FALSE,
       legend.position = "right",
       #legend = "",
       plot.percent.high = FALSE,
       plot.percents=TRUE) 
},width = 900)


output$QR_2 <- renderPlot({
  
  df<-df()
  QR_items <- df %>%
    select( "Qrconclude",  "Qrproblem",   "Qrevaluate") 
  names(QR_items) <- c(
    Qrconclude="Reached conclusions based on your analysis of numerical information (numbers, graphs, statistics, etc.) (During the current academic year, about how often have you:)",
    Qrproblem="Used numerical information to examine a real-world problem or issue (unemployment, climate change, public health, etc.)",
    Qrevaluate="Evaluated what others have concluded from numerical information")
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  QR_items_likert <-as.data.frame(QR_items) %>% 
    mutate_all(likert_recode_4) 
  QR_items_likert_1 <-as.data.frame(QR_items) %>% 
    mutate_all(likert_recode_4) %>% likert()
  ##### Group by Country
  aqr <- likert(QR_items_likert, grouping=df$study_group)
  
  plot(aqr,include.histogram=TRUE,wrap=200)
},width = 700)




output$QR_3 <- renderPlot({
  
  
  
  df<-df()
  QR_items <- df %>%
    select( "Qrconclude",  "Qrproblem",   "Qrevaluate") 
  names(QR_items) <- c(
    Qrconclude="Reached conclusions based on your analysis of numerical information (numbers, graphs, statistics, etc.) (During the current academic year, about how often have you:)",
    Qrproblem="Used numerical information to examine a real-world problem or issue (unemployment, climate change, public health, etc.)",
    Qrevaluate="Evaluated what others have concluded from numerical information")
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  QR_items_likert <-as.data.frame(QR_items) %>% 
    mutate_all(likert_recode_4) 
  QR_items_likert_1 <-as.data.frame(QR_items) %>% 
    mutate_all(likert_recode_4) %>% likert()
  ##### Group by Country
  aqr <- likert(QR_items_likert, grouping=df$study_group)
  
  a112 <- likert(QR_items_likert, grouping=df$AcUnit1)
  plot(a112,include.histogram=TRUE,wrap=200)
},width = 700)

output$QR_4 <- renderPlot({
  
  df<-df()
  QR_items <- df %>%
    select( "Qrconclude",  "Qrproblem",   "Qrevaluate") 
  names(QR_items) <- c(
    Qrconclude="Reached conclusions based on your analysis of numerical information (numbers, graphs, statistics, etc.) (During the current academic year, about how often have you:)",
    Qrproblem="Used numerical information to examine a real-world problem or issue (unemployment, climate change, public health, etc.)",
    Qrevaluate="Evaluated what others have concluded from numerical information")
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  QR_items_likert <-as.data.frame(QR_items) %>% 
    mutate_all(likert_recode_4) 
  QR_items_likert_1 <-as.data.frame(QR_items) %>% 
    mutate_all(likert_recode_4) %>% likert()
  ##### Group by Country
  aqr <- likert(QR_items_likert, grouping=df$study_group)
  
  
  df %>%
    select( "Seacademic","Selearnsup","Sediverse","Sesocial","Sewellness","Senonacad","Seactivities","Seevents") %>% 
    gg_miss_upset(., nsets = 10)
},width = 700, )



