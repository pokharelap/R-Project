# Load the necessary libraries
library(ggplot2)

# Create a scatter plot with custom axis limits and a correlation line
ggplot(data = states, aes(x = `Employer Health Insurance Coverage (2015)`, y = `Marketplace Health Insurance Coverage (2016)`)) +
  geom_point(aes(size = `Marketplace Tax Credits (2016)`)) +
  labs(title = "Scatter Plot of Health Insurance Coverage",
       x = "Employer Health Insurance Coverage (2015) (in 100,000s)",
       y = "Marketplace Health Insurance Coverage (2016) (in 100,000s)",
       size = "Marketplace Tax Credits (2016) (in 100,000s)") +
  scale_size_continuous(range = c(1, 10)) +
  theme_minimal() +
  xlim(0, 2500000) +  # Set x-axis limits (adjust as needed)
  ylim(0, 200000) +  # Set y-axis limits (adjust as needed)
  geom_smooth(method = "lm", color = "red", se = FALSE) +  # Add a linear regression line in red
  geom_text(
    aes(x = 1500000, y = 15000),  # Adjust the position of the text annotation
    label = paste("R² =", round(cor(states$`Employer Health Insurance Coverage (2015)`, states$`Marketplace Health Insurance Coverage (2016)`)^2, 2)),
    size = 4
  ) +
  theme(plot.caption = element_text(hjust = 0.5))  # Center the position of the caption
