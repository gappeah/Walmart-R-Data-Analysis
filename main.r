# Install required packages
install.packages("tidyverse")
install.packages("summarytools")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("languageserver")

# Load libraries
library(tidyverse)
library(summarytools)
library(ggplot2)
library(dplyr)

# Load your dataset
df <- read.csv("Walmart for R visualisation - Original.csv")

# View the first few rows of the dataset
head(df)

# Summary of the dataset
dfSummary(df)

# Check for missing values
summary(is.na(df))

# Calculate mean, median, and standard deviation for each column
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


# Assuming your dataset is called 'df'
# Subset the specific columns: Weekly_sales, Temperature, Fuel_price
correlation_matrix <- cor(df[, c("Weekly_sales", "Temperature", "Fuel_price")], use = "complete.obs")

# Print the correlation matrix
print(correlation_matrix)

# 

