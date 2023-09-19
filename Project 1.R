# Load the necessary libraries
library(ggplot2)

# Assuming you have your dataset stored in a variable called 'states'

# Create a ggplot object with the data
ggplot(data = states, aes(x = State)) +
  geom_bar(aes(y = `Uninsured Rate (2010)`, fill = "Uninsured Rate (2010)"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = `Uninsured Rate (2015)`, fill = "Uninsured Rate (2015)"), stat = "identity", position = "dodge") +
  labs(title = "Uninsured Rate Comparison (2010 vs. 2015) by State",
       x = "State",
       y = "Uninsured Rate",
       fill = "Year") +  # Set the legend title here
  scale_fill_manual(values = c("Uninsured Rate (2010)" = "blue", "Uninsured Rate (2015)" = "red")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

  


