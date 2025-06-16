# Amazon Best Sellers Analysis – Software Category  
**Author:** Israel David Duarte Herrera  
**Status:** 🚧 Work in Progress  
**Last Updated:** 2025  

## 📌 Overview  
This project explores Amazon Best Sellers data from the software category across multiple countries. The objective is to extract valuable insights into pricing strategies, product popularity, and customer engagement using exploratory data analysis (EDA), clustering, and data visualization.

The dataset contains product-level information such as price, customer rating, number of reviews, and country of ranking. This work demonstrates practical skills in data wrangling, unsupervised learning, and domain-specific interpretation using R.

---

## 🎯 Objectives  
- Identify top-performing software products based on customer feedback.  
- Analyze pricing and review trends across different markets.  
- Apply clustering algorithms to detect product groupings based on price and review count.  
- Create visualizations to support strategic insights in e-commerce.

---

## 📊 Dataset Summary  
**Source:** Kaggle  
**Filename:** `amazon_best_sellers_software.csv`  
**Main Features:**  
- `product_title`: Software product name  
- `product_price`: Price (in local currency)  
- `product_star_rating`: Average customer rating  
- `product_num_ratings`: Number of reviews  
- `rank`: Best Seller rank  
- `country`: Country where product is ranked

---

## 🛠️ Tools & Technologies  
- **R:** Data preprocessing, analysis, and modeling  
- **tidyverse:** Data wrangling (`dplyr`, `tidyr`)  
- **ggplot2:** Visualizations  
- **visdat:** Missing data diagnostics  
- **kmeans (stats):** Clustering analysis  
- **Git & GitHub:** Version control  
- **Kaggle:** Dataset source

---

## 🧪 How to Reproduce  
1. Clone the repository.  
2. Load the dataset `amazon_best_sellers_software.csv` into your R session.  
3. Run the script `kaggle-amazon-best-seller-software.R` for EDA, visualizations, and clustering.

---

## 📈 Potential Applications  
- Competitive analysis of digital product markets  
- Data-driven e-commerce pricing and strategy design  
- Uncovering consumer engagement trends in software

---

## 🔍 Project Highlights  
- Real-world data exploration with messy, multivariate features  
- Handling missing values and cleaning currency strings  
- K-means clustering to group products by market behavior  
- Insightful plots showing rating distributions and product clusters

---
