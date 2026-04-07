# R code for Statistical Visualization
library(tidyverse)

df <- read.csv("C:/Users/kkume/Desktop/Coursera/Coursera ML/efl_promotion_teams - seasonal_stats.csv")

# 1. 승격팀 vs 비승격팀의 유효슈팅(SOT) 분포 비교 (Boxplot)
df$is_promoted <- ifelse(df$team_rank <= 3, "Promoted", "Non-Promoted")

ggplot(df, aes(x=is_promoted, y=Avg_SOT, fill=is_promoted)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title="Shots on Target: Promoted vs Others", y="Average SOT per Game")

# 2. 득점과 승점의 상관관계 + 회귀선
ggplot(df, aes(x=Total_GF, y=Total_Points)) +
  geom_point(alpha=0.4, color="darkblue") +
  geom_smooth(method="lm", color="red") +
  theme_minimal() +
  labs(title="Linear Relationship: Total Goals vs Points")
