# Load the necessary libraries
library(ggplot2)

# Convert percentage to numeric for Uninsured Rate Change (2010-2015)
states$`Uninsured Rate Change (2010-2015)` <- as.numeric(sub("%", "", states$`Uninsured Rate Change (2010-2015)`))

# Create a scatter plot with custom axis limits and a correlation line
ggplot(data = states, aes(x = `Employer Health Insurance Coverage (2015)`, y = `Uninsured Rate Change (2010-2015)`)) +
  geom_point(aes(size = `Marketplace Tax Credits (2016)`)) +
  labs(title = "Scatter Plot: Uninsured Rate Change vs. Employer Health Insurance Coverage",
       x = "Employer Health Insurance Coverage (2015) (in 100,000s)",
       y = "Uninsured Rate Change (2010-2015)",
       size = "Marketplace Tax Credits (2016) (in 100,000s)") +
  scale_size_continuous(range = c(1, 10)) +
  theme_minimal() +
  xlim(0, 8000000) +  # Set x-axis limits from 0 to 8000000 (adjust as needed)
  ylim(-.25, .15) +  # Set y-axis limits from -15 to 1 (adjust as needed)
  geom_smooth(method = "lm", color = "red", se = FALSE) +  # Add a linear regression line in red +
  geom_text(
    aes(x = 4000000, y = -14),  # Adjust the position of the text annotation (centered)
    label = paste("R² =", round(cor(states$`Employer Health Insurance Coverage (2015)`, states$`Uninsured Rate Change (2010-2015)`)^2, 2)),
    size = 4
  ) +
  theme(plot.caption = element_text(hjust = 0.5))  # Adjust the position of the caption to the center

