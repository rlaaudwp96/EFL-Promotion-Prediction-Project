# R code for Statistical Visualization
library(tidyverse)

# Load the processed dataset
df <- read.csv("efl_promotion_teams - seasonal_stats.csv")

# 1. Compare Shots on Target (SOT) distribution: Promoted vs. Non-Promoted
# Define 'Promoted' as teams finishing in the top 3
df$is_promoted <- ifelse(df$team_rank <= 3, "Promoted", "Non-Promoted")

ggplot(df, aes(x=is_promoted, y=Avg_SOT, fill=is_promoted)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title="Shots on Target: Promoted vs Others", 
       x="Promotion Status", 
       y="Average SOT per Game")

# 2. Correlation between Total Goals and Total Points with Regression Line
ggplot(df, aes(x=Total_GF, y=Total_Points)) +
  geom_point(alpha=0.4, color="darkblue") +
  geom_smooth(method="lm", color="red") + # Add linear regression line
  theme_minimal() +
  labs(title="Linear Relationship: Total Goals vs Points", 
       x="Total Goals For (GF)", 
       y="Total Points")
