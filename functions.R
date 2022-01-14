likert_recode_4 <- function(x) {
  y <- ifelse(is.na(x), NA,
              ifelse(x == 1, "Never",
                     ifelse(x == 2, "Sometimes",
                            ifelse(x == 3, "Often", "Very Often"))))
  
  y <- factor(y, levels = c("Never", "Sometimes", "Often", "Very Often"))
  
  return(y)
}

likert_recode <- function(x) {
  y <- ifelse(is.na(x), NA,
              ifelse(x == 1, "Poor",
                     ifelse(x == 2, "2",
                            ifelse(x == 3, "3",
                                   ifelse(x == 4, "4",
                                          ifelse(x == 5, "5",
                                                 ifelse(x == 6, "6", "Excellent")))))))
  
  y <- factor(y, levels = c("Poor", "2", "3", "4","5","6", "Excellent"))
  
  return(y)
}