# Install required packages (this only needs to be done once)
install.packages("tidyverse")
install.packages("summarytools")
install.packages("conflicted")

# Load libraries
library(tidyverse)    # Loads ggplot2, dplyr, and other useful packages
library(summarytools)
library(conflicted)

# Load your dataset
df <- read.csv("Walmart for R visualisation - Original.csv")

# View the first few rows of the dataset
head(df)

# Summary of the dataset
dfSummary(df)

# Check for missing values
summary(is.na(df))

# Calculate mean, median, and standard deviation for each column
# Ensure column names are correctly spelled and case-sensitive
mean_sales <- mean(df$Weekly_Sales, na.rm = TRUE)
median_sales <- median(df$Weekly_Sales, na.rm = TRUE)
sd_sales <- sd(df$Weekly_Sales, na.rm = TRUE)

mean_temp <- mean(df$Temperature, na.rm = TRUE)
median_temp <- median(df$Temperature, na.rm = TRUE)
sd_temp <- sd(df$Temperature, na.rm = TRUE)

mean_fuel <- mean(df$Fuel_Price, na.rm = TRUE)
median_fuel <- median(df$Fuel_Price, na.rm = TRUE)
sd_fuel <- sd(df$Fuel_Price, na.rm = TRUE)

mean_cpi <- mean(df$CPI, na.rm = TRUE)
median_cpi <- median(df$CPI, na.rm = TRUE)
sd_cpi <- sd(df$CPI, na.rm = TRUE)

mean_unemp <- mean(df$Unemployment, na.rm = TRUE)
median_unemp <- median(df$Unemployment, na.rm = TRUE)
sd_unemp <- sd(df$Unemployment, na.rm = TRUE)

# Print results
mean_sales
median_sales
sd_sales

mean_temp
median_temp
sd_temp

mean_fuel
median_fuel
sd_fuel

mean_cpi
median_cpi
sd_cpi

mean_unemp
median_unemp
sd_unemp

# Correlation matrix
# Note the column names are case-sensitive; ensure they match exactly
correlation_matrix <- cor(df[, c("Weekly_Sales", "Temperature", "Fuel_Price")], use = "complete.obs")

# Print the correlation matrix
print(correlation_matrix)

# Create histogram for Weekly_Sales
ggplot(df, aes(x = Weekly_Sales)) +
  geom_histogram(binwidth = 5000, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Weekly Sales", x = "Weekly Sales", y = "Frequency") +
  theme_minimal()

# Create a box plot for Weekly_Sales
ggplot(df, aes(y = Weekly_Sales)) +
  geom_boxplot(fill = "orange", color = "black") +
  labs(title = "Boxplot of Weekly Sales", y = "Weekly Sales") +
  theme_minimal()

# Create a scatter plot for Weekly_Sales vs Temperature
ggplot(df, aes(x = Temperature, y = Weekly_Sales)) +
  geom_point(color = "red", size = 2, alpha = 0.6) +
  labs(title = "Scatter Plot of Weekly Sales vs Temperature", x = "Temperature", y = "Weekly Sales") +
  theme_minimal()

# Bar plot of total Weekly_Sales per Store
ggplot(df, aes(x = Store, y = Weekly_Sales)) +
  geom_bar(stat = "identity", fill = "green", color = "black", alpha = 0.7) +
  labs(title = "Total Weekly Sales by Store", x = "Store", y = "Total Weekly Sales") +
  theme_minimal()

# Density plot for Weekly_Sales
ggplot(df, aes(x = Weekly_Sales)) +
  geom_density(fill = "lightblue", alpha = 0.7) +
  labs(title = "Density Plot of Weekly Sales", x = "Weekly Sales", y = "Density") +
  theme_minimal()

# Correlation heatmap
library(reshape2)
cor_data <- cor(df[, c("Weekly_Sales", "Temperature", "Fuel_Price", "CPI", "Unemployment")], use = "complete.obs")
melted_cor_data <- melt(cor_data)

ggplot(melted_cor_data, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1), space = "Lab", name="Correlation") +
  labs(title = "Correlation Heatmap") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Boxplot of Weekly_Sales by Store
ggplot(df, aes(x = factor(Store), y = Weekly_Sales)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(title = "Boxplot of Weekly Sales by Store", x = "Store", y = "Weekly Sales") +
  theme_minimal()


# Faceted scatter plot for Weekly_Sales vs Temperature by Store
ggplot(df, aes(x = Temperature, y = Weekly_Sales)) +
  geom_point(color = "blue", alpha = 0.6) +
  labs(title = "Weekly Sales vs Temperature by Store") +
  facet_wrap(~ Store) +
  theme_minimal()


# Line plot comparing Weekly Sales over time for different stores
ggplot(df, aes(x = date, y = Weekly_Sales, color = Store)) +
  geom_line(size = 1) +
  labs(title = "Weekly Sales Over Time by Store", x = "Date", y = "Weekly Sales") +
  theme_minimal()

# Aggregate sales by month and create boxplot
df$month <- lubridate::floor_date(df$date, "month")

ggplot(df, aes(x = month, y = Weekly_Sales)) +
  geom_boxplot(fill = "orange", color = "black") +
  labs(title = "Boxplot of Weekly Sales by Month", x = "Month", y = "Weekly Sales") +
  theme_minimal()

# Area chart for cumulative weekly sales over time
ggplot(df, aes(x = date, y = cumsum(Weekly_Sales))) +
  geom_area(fill = "lightblue", color = "blue", alpha = 0.7) +
  labs(title = "Cumulative Weekly Sales Over Time", x = "Date", y = "Cumulative Sales") +
  theme_minimal()
