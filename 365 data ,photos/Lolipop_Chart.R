library(ggplot2)

data <- read.table("satranc.txt", header = FALSE, col.names = c("Names", "Surnames", "Ratings"))

data$Player <- paste(data$Names, data$Surnames)

ggplot(data, aes(x = Player, y = Ratings)) +
  geom_segment(aes(x = Player, xend = Player, y = 2800, yend = Ratings), color = "blue") +
  geom_point(color = "red", size = 3) +
  coord_flip() +
  coord_cartesian(ylim = c(2800, 2900)) +
  labs(title = "Chess Player Ratings - Lollipop Chart",
       x = "Player",
       y = "Rating")

