StudentSurvey.ie<-    data.frame(
  stringsAsFactors = FALSE,
  check.names = FALSE,
  All.StudentSurvey.ie = c("Collaborative Learning","Effective Teaching Practices",
                           "Higher-Order Learning","Learning Strategies",
                           "Learning, Creative and Social Skills",
                           "Quality of Interactions","Quantitative Reasoning",
                           "Reflective and Integrative Learning",
                           "Student-Faculty Interaction","Supportive Environment"),
  `2022` = c(29.18,33.08,
             34.87,31.96,33.16,38.39,20.82,32.02,13.17,
             28.33)
)




Universities<-    data.table::data.table(
  check.names = FALSE,
  StudentSurvey.ie.Universities = c("Collaborative Learning",
                                    "Effective Teaching Practices",
                                    "Higher-Order Learning","Learning Strategies",
                                    "Learning, Creative and Social Skills",
                                    "Quality of Interactions","Quantitative Reasoning",
                                    "Reflective and Integrative Learning",
                                    "Student-Faculty Interaction",
                                    "Supportive Environment"),
  `2022` = c(28.93,32.64,36.21,32.57,33.35,38,
             21.54,33.21,12.32,28.97)
)


Higher.Education.Institutions<-   data.table::data.table(
  check.names = FALSE,
  StudentSurvey.ie.Technological.Higher.Education.Institutions = c("Collaborative Learning",
                                                                   "Effective Teaching Practices",
                                                                   "Higher-Order Learning",
                                                                   "Learning Strategies",
                                                                   "Learning, Creative and Social Skills",
                                                                   "Quality of Interactions",
                                                                   "Quantitative Reasoning",
                                                                   "Reflective and Integrative Learning",
                                                                   "Student-Faculty Interaction",
                                                                   "Supportive Environment"),
  `2022` = c(29.64,
             33.37,32.88,30.72,
             32.67,38.41,
             20.17,30.15,14.3,
             27.31)
)





Other.Institutions<- data.table::data.table(
  check.names = FALSE,
  StudentSurvey.ie.Other.Institutions = c("Collaborative Learning",
                                          "Effective Teaching Practices","Higher-Order Learning",
                                          "Learning Strategies",
                                          "Learning, Creative and Social Skills",
                                          "Quality of Interactions",
                                          "Quantitative Reasoning",
                                          "Reflective and Integrative Learning",
                                          "Student-Faculty Interaction",
                                          "Supportive Environment"),
  `2022` = c(28.74,34.36,35.33,
             33.44,34.02,40.35,19.45,
             32.96,13.35,28.81)
)

seleccompare<-"Other.Institutions"
avgr=data.frame(0)
ifelse(seleccompare=="All StudentSurvey.ie",avgr<-All.StudentSurvey.ie,
              ifelse(seleccompare=="StudentSurvey.ie Universities",avgr<-Universities,
                     ifelse(seleccompare=="StudentSurvey.ie Technological Higher Education Institutions",avgr<-Higher.Education.Institutions,avgr<-Other.Institutions)))



avg<- data.frame(
  stringsAsFactors = FALSE,
  rowname = c("HO", "RI", "QR", "LS", "CL", "SF", "ET", "QI", "SE"),
  PGT = c(38.6, 33.9, 21.6, 34.4, 24.6, 12.3, 34.7, 31.7, 23.2),
  YF = c(34.2, 31.7, 21.7, 30.9, 31.0, 15.1, 31.8, 36.9, 23.5),
  Y1 = c(33.5, 28.6, 17.5, 30.6, 23.6, 8.1, 32.9, 29.5, 24.8)
)





High_level<-as.data.frame(High_level)
rownames(High_level) <- High_level$study_group
High_level$study_group <- NULL
transpose <- as.data.frame(t(as.matrix(High_level)))
transpose <- transpose(High_level)
rownames(transpose) <- colnames(High_level)
colnames(transpose) <- rownames(High_level)
names(transpose)<-"Score"


