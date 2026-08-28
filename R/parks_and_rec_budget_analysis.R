# Parks & Recreation Budget Analysis
# Author: Michael
# Purpose: Analyze departmental budgets from 2005 to 2020
# using dplyr and ggplot2.

library(dplyr)
library(ggplot2)

# Import dataset
# Update this path if running the script locally.
df <- read.csv("data/parks_and_rec_budget.csv")


# ---------------------------------------------------------
# 1. Total Budget by Department
# ---------------------------------------------------------

df %>%
  group_by(Department) %>%
  summarise(
    Total_Budget = sum(Budget_in_Thousands)
  ) %>%
  ggplot(
    aes(
      x = reorder(Department, -Total_Budget),
      y = Total_Budget,
      fill = Department
    )
  ) +
  geom_bar(stat = "identity") +
  ggtitle("Total Budget by Department") +
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  )


# ---------------------------------------------------------
# 2. Annual Budget for All Departments
# ---------------------------------------------------------

df %>%
  group_by(Year) %>%
  summarise(
    Annual_Budget = sum(Budget_in_Thousands)
  ) %>%
  ggplot(
    aes(
      x = Year,
      y = Annual_Budget
    )
  ) +
  geom_line() +
  geom_point() +
  ggtitle("Annual Budget for All Departments") +
  theme_minimal()


# ---------------------------------------------------------
# 3. Annual Budget per Department
# ---------------------------------------------------------

df %>%
  ggplot(
    aes(
      x = Year,
      y = Budget_in_Thousands,
      colour = Department
    )
  ) +
  geom_line() +
  ggtitle("Annual Budget per Department") +
  theme_minimal()
