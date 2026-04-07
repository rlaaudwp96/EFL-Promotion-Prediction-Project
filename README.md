# ⚽ EFL Championship Promotion Prediction Project
**An End-to-End Data Science Project using BigQuery, R, and Python**

This project analyzes 20 years of English Football League (EFL) Championship data (2004–2025) to identify the key statistical drivers of promotion and predict the final standings for the current 2024/25 season using Machine Learning.

---

## 📌 Project Overview
- **Objective**: Identify success factors for promotion and predict the final 2024/25 league table.
- **Data Source**: 11,351 match records from the EFL Championship.
- **Methodology**: 
    1. **BigQuery**: Data engineering and feature extraction.
    2. **R**: Statistical hypothesis testing (T-test).
    3. **Python**: Supervised Learning (Multiple Linear Regression).

---

## 🛠 Tech Stack
- **Data Engineering**: **Google BigQuery (SQL)**
- **Statistical Analysis**: **R (T-test, SLR)**
- **Machine Learning**: **Python (Scikit-learn)**

---

## 📊 Key Stages & Results

### 1. Data Engineering (BigQuery SQL)

Transformed raw match-level logs into seasonal team statistics. Calculated "Points" (3 for Win, 1 for Draw) and generated seasonal rankings using window functions.
- **Key File**: `/sql/EFL EDA.sql`

### 2. Statistical Hypothesis Testing (R Analysis)

Validated that the difference in "Average Shots on Target (SOT)" between promoted teams (Top 3) and non-promoted teams is statistically significant (**p < 0.05**).
- **Key File**: `/R/efl_promotion_analysis_r.R`

### 3. Supervised Machine Learning (Python ML)

Built a Multiple Linear Regression (MLR) model to simulate the end of the 2024/25 season.
- **Accuracy**: Achieved an **R² score of 0.9026**.
- **Insights**: Confirmed that defensive stability (GA) is as critical as offensive power (GF) for promotion.
- **Key File**: `/python/efl_ml.ipynb`

---

## 🚀 2024/25 Season Final Projections
Based on current underlying metrics, the model projects the following Top 3 candidates for promotion:

| Rank | Team | Predicted Final Points |
| :--- | :--- | :--- |
| **1st** | **Leeds United** | **81.90 pts** |
| **2nd** | **Burnley** | **78.24 pts** |
| **3rd** | **Sheffield United** | **76.09 pts** |

---

## 📂 Project Structure
```text
├── sql/
│   └── EFL EDA.sql             # BigQuery preprocessing
├── R/
│   └── efl_promotion_analysis_r.R  # Statistical visualizations
├── python/
│   └── efl_ml.ipynb            # Supervised Learning (Regression)
├── data/
│   └── seasonal_stats.csv       # Processed dataset
└── README.md                   # Project report
