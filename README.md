# Walmart Sales Data Visualization and Analysis in R

This project contains code to analyze and visualize Walmart sales data using R. The analysis includes calculating summary statistics, visualizing data distributions, and exploring correlations between variables.

## Prerequisites

Before running the code, make sure you have R installed on your system. You will also need to install the required R packages. Follow the steps below to set up the environment.

### 1. Install Required Packages

To install the necessary packages, run the following commands in your R console. These only need to be done once.

```r
# Install required packages (this only needs to be done once)
install.packages("tidyverse")
install.packages("summarytools")
install.packages("conflicted")
install.packages("lubridate")
install.packages("reshape2")
```

### 2. Load Libraries

After installing the packages, load the required libraries for data analysis and visualization.

```r
# Load libraries
library(tidyverse)    # Loads ggplot2, dplyr, and other useful packages
library(summarytools) # For generating data summaries
library(conflicted)   # To handle conflicts between functions from different libraries
library(lubridate)    # For handling date and time
library(reshape2)     # For reshaping data
```

### 3. Load Dataset

Make sure the CSV file (`Walmart for R visualisation - Original.csv`) is in the same directory as your R script. Load the dataset using the `read.csv` function:

```r
# Load your dataset
df <- read.csv("Walmart for R visualisation - Original.csv")

# View the first few rows of the dataset
head(df)
```

### 4. Summary and Missing Values Check

Generate a summary of the dataset and check for missing values:

```r
# Summary of the dataset
dfSummary(df)

# Check for missing values
summary(is.na(df))
```

### 5. Calculate Statistics

Calculate the mean, median, and standard deviation for various columns (e.g., Weekly Sales, Temperature, etc.):

```r
# Calculate statistics for Weekly Sales, Temperature, and other columns
mean_sales <- mean(df$Weekly_Sales, na.rm = TRUE)
median_sales <- median(df$Weekly_Sales, na.rm = TRUE)
sd_sales <- sd(df$Weekly_Sales, na.rm = TRUE)

# Repeat for Temperature, Fuel_Price, CPI, and Unemployment
```

### 6. Correlation Matrix

Create a correlation matrix for selected variables:

```r
# Correlation matrix
correlation_matrix <- cor(df[, c("Weekly_Sales", "Temperature", "Fuel_Price")], use = "complete.obs")

# Print the correlation matrix
print(correlation_matrix)
```

### 7. Data Visualizations

The code includes several visualizations created using `ggplot2`.

#### Histogram of Weekly Sales

```r
ggplot(df, aes(x = Weekly_Sales)) +
  geom_histogram(binwidth = 5000, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Weekly Sales", x = "Weekly Sales", y = "Frequency") +
  theme_minimal()
```

#### Boxplot of Weekly Sales

```r
ggplot(df, aes(y = Weekly_Sales)) +
  geom_boxplot(fill = "orange", color = "black") +
  labs(title = "Boxplot of Weekly Sales", y = "Weekly Sales") +
  theme_minimal()
```

#### Scatter Plot of Weekly Sales vs Temperature

```r
ggplot(df, aes(x = Temperature, y = Weekly_Sales)) +
  geom_point(color = "red", size = 2, alpha = 0.6) +
  labs(title = "Scatter Plot of Weekly Sales vs Temperature", x = "Temperature", y = "Weekly Sales") +
  theme_minimal()
```

#### Correlation Heatmap

```r
cor_data <- cor(df[, c("Weekly_Sales", "Temperature", "Fuel_Price", "CPI", "Unemployment")], use = "complete.obs")
melted_cor_data <- melt(cor_data)

ggplot(melted_cor_data, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1), space = "Lab", name="Correlation") +
  labs(title = "Correlation Heatmap") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

### 8. Additional Visualizations

- **Total Weekly Sales by Store (Bar Plot)**
- **Boxplot of Weekly Sales by Month**
- **Line Plot of Weekly Sales Over Time by Store**
- **Area Chart for Cumulative Weekly Sales**

Explore these additional plots in the code provided to visualize other aspects of the dataset.

---

### Files

- **`Walmart for R visualisation - Original.csv`**: The dataset used for the analysis.
- **`README.md`**: This readme file providing instructions for the analysis.
- **R script**: Use the provided R script with the code snippets to perform the analysis and visualizations.

### How to Run

1. Install R and the required packages.
2. Download or clone this repository.
3. Place the dataset in the same directory as your R script.
4. Run the R script to perform the analysis and generate visualizations.
