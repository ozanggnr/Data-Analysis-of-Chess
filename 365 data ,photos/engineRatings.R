library(ggplot2)

data <- read.table("chessEngines.txt", header = FALSE, col.names = c("Engine", "Rating", "Games", "Won", "Avg Opp"))
data$Rank <- rev(rank(data$Rating, ties.method = "min"))


ggplot(data, aes(x = reorder(Engine, -Rating), y = Rating, fill = factor(Rank))) +
  geom_bar(stat = "identity") +
  labs(title = "Engine Ratings and Rankings",
       x = "Engine",
       y = "Rating") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_cartesian(ylim = c(3400, 3700))

