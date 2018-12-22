## Title:     Policy Feedback Effects on Mass Publics:
##            A Quantitative Review
## 
## Author:    Erik Gahner Larsen
##            E.G.Larsen@kent.ac.uk
##        

library("tidyverse")
library("lme4")
library("stargazer")

review <- read_csv("review.csv")

reg.1 <- lm(scoefsize ~ as.factor(depv), data=review)
reg.2 <- lm(scoefsize ~ as.factor(depv) + as.factor(issue), data=review)
reg.3 <- lm(scoefsize ~ as.factor(depv) + as.factor(issue) + personal, data=review)
reg.4 <- lmer(scoefsize ~ as.factor(depv) + (1 | studyid), data = review)
reg.5 <- lmer(scoefsize ~ as.factor(depv) + as.factor(issue) + (1 | studyid), data = review)
reg.6 <- lmer(scoefsize ~ as.factor(depv) + as.factor(issue) + personal + (1 | studyid), data = review)


stargazer(reg.1, reg.2, reg.3, reg.4, reg.5, reg.6,
          align = TRUE,
          column.sep.width = "0pt",
          no.space = TRUE,
          digits= 2,
          model.numbers = FALSE,
          covariate.labels = c("Outcome: Participation", "Outcome: Policy attitude", "Issue: Education",
                               "Issue: Social", "Issue: Health care", "Proximity: Personal"),
          title="Determinants of effect sizes in policy feedback studies",
          model.names=FALSE,
          font.size = "footnotesize",
          notes.align = "l",
          column.labels=c("OLS", "OLS", "OLS", "ML, RE", "ML, RE", "ML, RE"),
          type="text",
          out="table-effect.htm")

ggplot(review, aes(x=depv, fill=depv_val, colour=depv_val)) +
  geom_bar(position="identity") +
  scale_fill_manual(values=c("#F6B5D5", "#B3D7C6", "#B8D6E5")) +
  ylab("") +
  xlab("") +
  facet_wrap(~ issue_val) +
  scale_x_continuous(breaks=c(1,2,3), labels=c("Political\nattitude", "Political\nengagement", "Policy \nattitude")) +
  theme_bw() +
  theme(legend.position="bottom") +
  theme(legend.title=element_blank())

ggsave("Fig1.pdf", width=5, height=5)


ggplot(review, aes(x=zscore_abs, fill=depv_val)) + 
  geom_histogram(alpha=0.4, position="identity") +
  scale_fill_manual(values=c("#EB4295", "#429969", "#459BC8")) +
  theme_bw() +
  theme(legend.position="bottom") +
  theme(legend.title=element_blank()) +
  scale_x_continuous(expression(paste("Test statistic (", beta, "/se)")),
                     breaks=c(0,1.96,5,10,20)) +
  ylab("")

ggsave("Fig2.pdf", width=5, height=5)

ggplot(review, aes(x=scoefsize, fill=depv_val)) + 
  geom_histogram(alpha=0.4, position="identity") +
  scale_fill_manual(values=c("#EB4295", "#429969", "#459BC8")) +
  theme_bw() +
  theme(legend.position="bottom") +
  theme(legend.title=element_blank()) + 
  xlab("Standardized effect") +
  ylab("")

ggsave("Fig3.pdf", width=5, height=5)


review %>%
  filter(!is.na(direction)) %>%
  ggplot(aes(x=depv, fill=depv_val, colour=depv_val)) +
  geom_bar(position="identity") +
  scale_fill_manual(values=c("#F6B5D5", "#B3D7C6", "#B8D6E5")) +
  ylab("") +
  xlab("") +
  facet_wrap(~ direction_val) +
  scale_x_continuous(breaks=c(1,2,3), labels=c("Political\nattitude", "Political\nengagement", "Policy \nattitude")) +
  theme_bw() +
  theme(legend.position="bottom") +
  theme(legend.title=element_blank())

ggsave("Fig4.pdf", width=7, height=3)


review %>%
  filter(coefnr == 1) %>%
  ggplot(aes(x=depv, fill=depv_val, colour=depv_val)) +
  geom_bar(position="identity") +
  scale_fill_manual(values=c("#F6B5D5", "#B3D7C6", "#B8D6E5")) +
  ylab("") +
  xlab("") +
  facet_wrap(~ data) +
  scale_x_continuous(breaks=c(1,2,3), labels=c("Political\nattitude", "Political\nengagement", "Policy \nattitude")) +
  theme_bw() +
  theme(legend.position="bottom") +
  theme(legend.title=element_blank())

ggsave("Fig5.pdf", width=5, height=4)

review %>%
  ggplot(aes(x=depv, fill=depv_val, colour=depv_val)) +
  geom_bar(position="identity") +
  scale_fill_manual(values=c("#F6B5D5", "#B3D7C6", "#B8D6E5")) +
  ylab("") +
  xlab("") +
  facet_wrap(~ personal_val) +
  scale_x_continuous(breaks=c(1,2,3), labels=c("Political\nattitude", "Political\nengagement", "Policy \nattitude")) +
  theme_bw() +
  theme(legend.position="bottom") +
  theme(legend.title=element_blank())

ggsave("Fig6.pdf", width=5, height=4)


stargazer(as.data.frame(review[c("personal", "z", "direction", "zscore_abs", "scoefsize")]),
          covariate.labels = c("Personal", "Conditional effect", "Direction", "Test statistic", "Effect size"),
          title = "Literature review, summary statistics",
          summary = TRUE, type="text")


# Create and save sessionInfo.txt
writeLines(capture.output(sessionInfo()), "sessionInfo.txt")