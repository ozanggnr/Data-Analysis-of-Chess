library(ggplot2)
# Read data from chess2.txt
data <- read.table("chess2.txt", header = TRUE)
# Create a scatter plot
ggplot(data, aes(x = age_group)) +
  geom_point(aes(y = players2000, color = "blue"), shape = 16, size = 4) +
  geom_point(aes(y = players2022, color = "red"), shape = 17, size = 4) +
  labs(title = "Chess Players by Age Group (2000 vs 2022)",
       x = "Age Group",
       y = "Number of Players") +
  scale_color_manual(values = c("blue" = "blue", "red" = "red"),
                     labels = c("blue" = "2000 Players", "red" = "2022 Players")) +
  theme_minimal()

library(ggplot2)

# Read data from the CSV file
chess_data <- read.csv("chess.csv")

# Create a bar plot
ggplot(chess_data, aes(x = country, y = number_of_players, fill = country)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(breaks = seq(min(chess_data$number_of_players), max(chess_data$number_of_players), by = 1)) +
  labs(title = "Number of Chess Players by Country", 
       x = "Country", 
       y = "Number of Players") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

