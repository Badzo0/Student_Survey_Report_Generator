output$SE_1 <- renderPlot({
  
  
  df<-df()
  SE_items <- df %>%
    select( "Seacademic","Selearnsup","Sediverse","Sesocial","Sewellness","Senonacad","Seactivities","Seevents") 
  
  names(SE_items) <- c(
    Seacademic="Providing support to help students succeed academically (How much does your institution emphasise:)",
    Selearnsup="Using learning support services (learning centre, computer centre, maths support, writing support etc.)",
    Sediverse="Contact among students from different backgrounds (social, racial/ethnic, religious, etc.)",
    Sesocial="Providing opportunities to be involved socially",
    Sewellness="Providing support for your overall well-being (recreation, health care, counselling, etc.)",
    Senonacad="Helping you manage your non-academic responsibilities (work, family, etc.)",
    Seactivities="Attending campus activities and events (special speakers, cultural performances, sporting events, etc.)",
    Seevents="Attending events that address important social, economic, or political issues")
  
  
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  
  SE_items_likert <-as.data.frame(SE_items) %>% 
    mutate_all(likert_recode_4) 
  
  
  SE_items_likert_1 <-as.data.frame(SE_items) %>% 
    mutate_all(likert_recode_4) %>% likert()
  
  ##### Group by Country
  ase <- likert(SE_items_likert, grouping=df$study_group)
  
  
  
  
  plot(SE_items_likert_1, 
       # Group the items alphabetically
       group.order=names(SE_items),
       plot.percent.low = FALSE,
       legend.position = "right",
       #legend = "",
       plot.percent.high = FALSE,
       plot.percents=TRUE) 
},width = 800, height = 400 )
#outputOptions(output, "SE_1", suspendWhenHidden = FALSE)

output$SE_2 <- renderPlot({
  
  
  
  df<-df()
  SE_items <- df %>%
    select( "Seacademic","Selearnsup","Sediverse","Sesocial","Sewellness","Senonacad","Seactivities","Seevents") 
  
  names(SE_items) <- c(
    Seacademic="Providing support to help students succeed academically (How much does your institution emphasise:)",
    Selearnsup="Using learning support services (learning centre, computer centre, maths support, writing support etc.)",
    Sediverse="Contact among students from different backgrounds (social, racial/ethnic, religious, etc.)",
    Sesocial="Providing opportunities to be involved socially",
    Sewellness="Providing support for your overall well-being (recreation, health care, counselling, etc.)",
    Senonacad="Helping you manage your non-academic responsibilities (work, family, etc.)",
    Seactivities="Attending campus activities and events (special speakers, cultural performances, sporting events, etc.)",
    Seevents="Attending events that address important social, economic, or political issues")
  
  
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  
  SE_items_likert <-as.data.frame(SE_items) %>% 
    mutate_all(likert_recode_4) 
  
  
  SE_items_likert_1 <-as.data.frame(SE_items) %>% 
    mutate_all(likert_recode_4) %>% likert()
  
  ##### Group by Country
  ase <- likert(SE_items_likert, grouping=df$study_group)
  
  
  ase <- likert(SE_items_likert, grouping=df$study_group)
  
  plot(ase,include.histogram=TRUE,wrap=200)
},width = 700, height = 600)
#outputOptions(output, "SE_2", suspendWhenHidden = FALSE)

output$SE_3 <- renderPlot({
  df<-df()
  SE_items <- df %>%
    select( "Seacademic","Selearnsup","Sediverse","Sesocial","Sewellness","Senonacad","Seactivities","Seevents") 
  
  names(SE_items) <- c(
    Seacademic="Providing support to help students succeed academically (How much does your institution emphasise:)",
    Selearnsup="Using learning support services (learning centre, computer centre, maths support, writing support etc.)",
    Sediverse="Contact among students from different backgrounds (social, racial/ethnic, religious, etc.)",
    Sesocial="Providing opportunities to be involved socially",
    Sewellness="Providing support for your overall well-being (recreation, health care, counselling, etc.)",
    Senonacad="Helping you manage your non-academic responsibilities (work, family, etc.)",
    Seactivities="Attending campus activities and events (special speakers, cultural performances, sporting events, etc.)",
    Seevents="Attending events that address important social, economic, or political issues")
  
  
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  
  SE_items_likert <-as.data.frame(SE_items) %>% 
    mutate_all(likert_recode_4) 
  
  
  SE_items_likert_1 <-as.data.frame(SE_items) %>% 
    mutate_all(likert_recode_4) %>% likert()
  
  ##### Group by Country
  ase <- likert(SE_items_likert, grouping=df$study_group)
  
  
  a112 <- likert(SE_items_likert, grouping=df$AcUnit1)
  plot(a112,include.histogram=TRUE,wrap=200)
},width = 700, height = 600)
#outputOptions(output, "SE_3", suspendWhenHidden = FALSE)

output$SE_4 <- renderPlot({
  
  df<-df()
  SE_items <- df %>%
    select( "Seacademic","Selearnsup","Sediverse","Sesocial","Sewellness","Senonacad","Seactivities","Seevents") 
  
  names(SE_items) <- c(
    Seacademic="Providing support to help students succeed academically (How much does your institution emphasise:)",
    Selearnsup="Using learning support services (learning centre, computer centre, maths support, writing support etc.)",
    Sediverse="Contact among students from different backgrounds (social, racial/ethnic, religious, etc.)",
    Sesocial="Providing opportunities to be involved socially",
    Sewellness="Providing support for your overall well-being (recreation, health care, counselling, etc.)",
    Senonacad="Helping you manage your non-academic responsibilities (work, family, etc.)",
    Seactivities="Attending campus activities and events (special speakers, cultural performances, sporting events, etc.)",
    Seevents="Attending events that address important social, economic, or political issues")
  
  
  df$study_group <- factor(df$study_group, levels = c("Y1", "YF", "PGT"))
  
  SE_items_likert <-as.data.frame(SE_items) %>% 
    mutate_all(likert_recode_4) 
  
  
  SE_items_likert_1 <-as.data.frame(SE_items) %>% 
    mutate_all(likert_recode_4) %>% likert()
  
  ##### Group by Country
  ase <- likert(SE_items_likert, grouping=df$study_group)
  
  
  df %>%
    select( "Seacademic","Selearnsup","Sediverse","Sesocial","Sewellness","Senonacad","Seactivities","Seevents") %>% 
    gg_miss_upset(., nsets = 10)
},width = 700, height = 300 )
#outputOptions(output, "SE_4", suspendWhenHidden = FALSE)







