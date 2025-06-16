# Amazon Best Sellers Analysis: Software Category
# Author: Israel David Duarte Herrera
# Contact: www.linkedin.com/in/israel-duarte
# GitHub: https://github.com/Israelddh
# Date: 2025
# Description:
#   Exploratory Data Analysis and Clustering of Amazon software products
#   to uncover pricing, review trends, and product groupings across countries.
#
# Project: Data Science Portfolio - Amazon Software Best Sellers
# Purpose:
#   Demonstrate data cleaning, visualization, and unsupervised learning skills
#   using real-world e-commerce dataset.
#
# Tools:
#   R (readr, dplyr, ggplot2, visdat)
#
# Notes:
#   This script performs data wrangling, exploratory analysis, and k-means clustering.

# ================================
# Load required libraries
# ================================
if (!requireNamespace("hivecolors", quietly = TRUE)) {
  if (!requireNamespace("devtools", quietly = TRUE)) {
    install.packages("devtools")
  }
  devtools::install_github("Israelddh/hivecolors")
}

library(readr)
library(dplyr)
library(ggplot2)
library(visdat)
library(hivecolors)

# ================================
# Create Plots folder if not exists
# ================================
if (!dir.exists("Plots")) {
  dir.create("Plots")
}

# ================================
# Load dataset
# ================================
data <- read.csv("amazon_best_sellers_software.csv", stringsAsFactors = FALSE)

# Inspect structure
str(data)
head(data)
summary(data)

# ================================
# Clean and convert product price
# ================================
unique(data$product_price)
data$product_price_clean <- gsub("[^0-9\\.]", "", data$product_price)
data$product_price_clean <- as.numeric(data$product_price_clean)

sum(is.na(data$product_price_clean))

# ================================
# Visualize missing data
# ================================
vis_miss(data)
ggsave("Plots/00_missing_data_overview.png", width = 8, height = 6, bg = "white")

# ================================
# Handle missing star ratings
# ================================
missing_star_count <- sum(is.na(data$product_star_rating))
missing_star_pct <- round(missing_star_count / nrow(data) * 100, 2)
cat("Missing star ratings: ", missing_star_count, " (", missing_star_pct, "%)\n")

summary(data$product_num_ratings[is.na(data$product_star_rating)])

data_clean <- data %>% 
  filter(!is.na(product_star_rating), !is.na(product_num_ratings))

cat("Remaining rows after filtering: ", nrow(data_clean), "\n")

# ================================
# Plot distribution of product star ratings
# ================================
p1 <- ggplot(data_clean, aes(x = product_star_rating)) +
  geom_bar(fill = hivecolors::hive_colors(10)[4], color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Product Star Ratings", x = "Star Rating", y = "Count")
print(p1)
ggsave("Plots/01_star_rating_distribution.png", plot = p1, width = 8, height = 6, bg = "white")

# ================================
# Check and plot distribution of number of reviews
# ================================
missing_num_ratings <- sum(is.na(data_clean$product_num_ratings))
cat("Missing number of reviews: ", missing_num_ratings, "\n")

quantiles <- quantile(data_clean$product_num_ratings, probs = c(0.75, 0.99))
print(quantiles)

p2 <- ggplot(data_clean, aes(x = product_num_ratings)) +
  geom_histogram(binwidth = 500, fill = hivecolors::hive_colors(10)[4], color = "black", alpha = 0.7) +
  theme_minimal() +
  labs(title = "Distribution of Number of Reviews", x = "Number of Reviews", y = "Count")
print(p2)

# Guardar p2 con fondo blanco usando png()
png("Plots/02_review_distribution.png", width = 8*72, height = 6*72, bg = "white", res = 96)
print(p2)
dev.off()

# ================================
# Scatter plot: Price vs. Number of Reviews
# ================================
correlation <- cor(data_clean$product_price_clean, data_clean$product_num_ratings, use = "complete.obs")
cat("Correlation between price and number of reviews: ", correlation, "\n")

p3 <- ggplot(data_clean, aes(x = product_price_clean, y = product_num_ratings)) +
  geom_point(alpha = 0.5, color = hivecolors::hive_colors(10)[4]) +
  theme_minimal() +
  labs(title = "Price vs. Number of Reviews", x = "Price ($)", y = "Number of Reviews")
print(p3)

# Guardar p3 con fondo blanco usando png()
png("Plots/03_price_vs_reviews.png", width = 8*72, height = 6*72, bg = "white", res = 96)
print(p3)
dev.off()

# ===

# Status: 🚧 Work in Progress
