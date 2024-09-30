data <- read.table("1970-1980.txt", col.names = c("Name", "Surname", "Rating"), header = FALSE, stringsAsFactors = FALSE)

# Replace hyphens with NA in the Rating column
data$Rating[data$Rating == "-"] <- NA

# Extract numeric ratings
data$Rating <- as.numeric(data$Rating)

# Create an empty data frame to store statistics
stats_df <- data.frame(
  Metric = c("Mean", "Mod", "Median", "Max", "Min", "SD", "Q1", "Q3", "Skewness", "Kurtosis", "Trimmed_Mean", "NAs"),
  Value = numeric(12)
)

# Calculate statistics
stats_df$Value[1] <- mean(data$Rating, na.rm = TRUE)
stats_df$Value[2] <- as.numeric(names(sort(table(data$Rating), decreasing = TRUE)[1]))
stats_df$Value[3] <- median(data$Rating, na.rm = TRUE)
stats_df$Value[4] <- max(data$Rating, na.rm = TRUE)
stats_df$Value[5] <- min(data$Rating, na.rm = TRUE)
stats_df$Value[6] <- sd(data$Rating, na.rm = TRUE)
stats_df$Value[7] <- quantile(data$Rating, 0.25, na.rm = TRUE)
stats_df$Value[8] <- quantile(data$Rating, 0.75, na.rm = TRUE)
stats_df$Value[9] <- moments::skewness(data$Rating, na.rm = TRUE)
stats_df$Value[10] <- moments::kurtosis(data$Rating, na.rm = TRUE)
stats_df$Value[11] <- mean(data$Rating[data$Rating >= quantile(data$Rating, 0.1, na.rm = TRUE) & data$Rating <= quantile(data$Rating, 0.9, na.rm = TRUE)], na.rm = TRUE)
stats_df$Value[12] <- sum(is.na(data$Rating))

# Print the resulting data frame
print(stats_df)