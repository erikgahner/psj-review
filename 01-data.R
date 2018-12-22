## Title:     Policy Feedback Effects on Mass Publics:
##            A Quantitative Review
## 
## Author:    Erik Gahner Larsen
##            E.G.Larsen@kent.ac.uk
##        


library("tidyverse")
library("rio")


review <- import("feedbackreview.xlsx")

names(review) <- c("id", "studyid", "author", "year", "domain", "context", "n", "x", "y", "z", 
                   "data", "coefnr", "coef", "se", "xmin", "xmax", "ymin", "ymax", "xsd", "ysd", "interpretation",
                   "source", "personal", "direction", "estimation", "issue", "depv", "note", "scoef")


review$direction[review$direction > 1] <- NA
review$direction_val <- recode(review$direction,
                               `-1` = "Negative",
                               `0` = "None",
                               `1` = "Positive")

review$issue_val <- recode(review$issue,
                           `0` = "Other",
                           `1` = "Education",
                           `2` = "Social",
                           `3` = "Health care")

review$depv_val <- recode(review$depv,
                          `1` = "Political attitude",
                          `2` = "Political engagement",
                          `3` = "Policy attitude")

review <- review %>% mutate(
  personal_val = ifelse(personal == 1, "Personal", "General"),
  zscore = coef / se,
  zscore_abs = abs(zscore),
  ysd = as.numeric(ysd)
)

review$scoef <- ifelse(is.na(review$scoef) & review$z == 0, review$coef * (review$xsd/review$ysd), review$scoef)
review$scoefsize <- ifelse(review$scoef < 0, review$scoef * -1, review$scoef)

write_csv(review, "review.csv")