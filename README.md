# 📌 AI-Powered Customer Churn Prediction  

**Author:** Balla Diaite  
**Role:** Data Analyst | Data Scientist  

🚀 **Project Overview:**  
This project builds a **data-driven churn prediction system** to help businesses identify at-risk customers, understand churn drivers, and implement effective retention strategies. By leveraging **SQL, machine learning, and business intelligence tools**, we transform raw customer data into actionable insights.  

---

## 📖 Table of Contents  

- [1️⃣ Data Collection & Cleaning](#1️⃣-data-collection--cleaning)  
- [2️⃣ SQL-Based Exploratory Data Analysis (EDA)](#2️⃣-sql-based-exploratory-data-analysis-eda)  
- [3️⃣ Python-Based Exploratory Data Analysis (EDA)](#3️⃣-python-based-exploratory-data-analysis-eda)  
- [4️⃣ Feature Engineering & Machine Learning](#4️⃣-feature-engineering--machine-learning)  
- [5️⃣ Power BI Dashboard](#5️⃣-power-bi-dashboard)  
- [6️⃣ API Deployment](#6️⃣-api-deployment)  
- [7️⃣ Key Takeaways & Business Insights](#7️⃣-key-takeaways--business-insights)  
- [📌 How to Use the API](#📌-how-to-use-the-api)  
- [📌 Future Improvements](#📌-future-improvements)  

---

## 1️⃣ Data Collection & Cleaning  

A **high-quality dataset** is crucial for any predictive model. This project uses the **[Telco Customer Churn dataset](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)** from Kaggle, which contains customer demographics, service usage, billing details, and churn labels.  

### **Key Preprocessing Steps:**  
✅ **Data Standardization:** Categorical values converted into machine-readable format.  
✅ **Missing Value Treatment:** Missing `TotalCharges` values replaced to maintain data integrity.  
✅ **Feature Encoding:** Yes/No responses converted to binary format.  
✅ **Data Type Optimization:** Ensured proper numerical and categorical data formats.  
✅ **Unnecessary Columns Removed:** `customerID` dropped for efficiency.  
✅ **Final Dataset Saved:** Processed dataset stored for further analysis.  

---

## 2️⃣ SQL-Based Exploratory Data Analysis (EDA)  

This phase leverages **SQL to uncover key churn patterns**, segment customers, and assess the financial impact of churn.  

### **Key Findings & Business Impact**  
✔ **High churn rate (26.54%)**, with **month-to-month contracts** showing the highest churn (42.71%).  
✔ **Fiber Optic users churn the most (41.89%)**, potentially due to cost concerns.  
✔ **Customers paying via Electronic Check (45.29% churn rate)** are at higher risk.  
✔ **Churned customers pay higher monthly charges ($74.44) but have shorter tenures (18 months).**  
✔ **Senior citizens churn more (41.68%)**, possibly due to pricing sensitivity.  

✅ **Retention Recommendations:** Encourage **long-term contracts**, optimize **pricing models**, promote **auto-payments**, and implement **proactive early retention efforts**.

---

## 3️⃣ Python-Based Exploratory Data Analysis (EDA)  

This section leverages **Python (Matplotlib & Seaborn) to visualize churn trends**, identify customer behavior patterns, and validate SQL-based findings.

### **Key Findings & Business Impact**  
🔹 **Churn Distribution**: 1 in 4 customers leave → **Stronger engagement programs needed**.  
🔹 **Tenure & Churn**: Most churned customers leave **within 18 months** → **Early retention strategies crucial**.  
🔹 **Pricing Sensitivity**: Churned customers have **higher monthly charges ($74) than retained ones ($61)** → **Discounted long-term plans could help**.  
🔹 **Contract Type & Churn**: **Month-to-month contracts drive the highest churn** → **Encourage annual contracts**.  
🔹 **Payment Method & Churn**: **Electronic Check users churn most (~45%)** → **Promote automated payments**.  
🔹 **Feature Correlation**: Tenure and contract type are **strongest churn predictors** → **Customer longevity is key**.  

✅ **Retention Recommendations:** Introduce **contract-based incentives**, offer **targeted discounts**, improve **customer onboarding**, and promote **auto-payments**.

---

## 4️⃣ Feature Engineering & Machine Learning  

### **1️⃣ Problem Statement**  
Customer churn is a **critical issue** in subscription-based businesses, impacting revenue and retention. The objective of this phase was to build a **high-performing machine learning model** that accurately predicts churn.  

🔹 **Key Challenges Addressed:**  
✅ Handling **missing values** and incorrect data types.  
✅ **Feature engineering** to create meaningful variables.  
✅ **Balancing class imbalance** to prevent biased predictions.  
✅ Choosing a **model that optimizes precision, recall, and interpretability**.  
✅ Fine-tuning **hyperparameters** for the best performance.  

---

### **2️⃣ Key Challenges & Solutions**  

#### **🔹 Challenge 1: Data Cleaning & Handling Missing Values**  
- **Issue:** `TotalCharges` contained missing values, and categorical variables were not encoded.  
- **Solution:** Converted `TotalCharges` to numeric, encoded categorical variables, and created **AutoPayment flag**.  
- **Impact:** **Ensured model interpretability and consistency.**  

#### **🔹 Challenge 2: Feature Engineering**  
- **Issue:** Raw data lacked behavioral insights.  
- **Solution:** Created new **meaningful features**:  
  ✔ `TenureCategory` (Short, Medium, Long-term customers).  
  ✔ `MonthlyChargesCategory` (Low, Medium, High, Very High spending).  
  ✔ `SupportServices` (Bundled security & tech support).  
  ✔ `AutoPayment` (Manual vs. Automatic payments).  
- **Impact:** **Enhanced model performance and business explainability.**  

#### **🔹 Challenge 3: Class Imbalance**  
- **Issue:** **Only 26.5% of customers churned**, causing model bias.  
- **Solution:** Applied **SMOTE (Synthetic Minority Oversampling Technique)** to rebalance dataset.  
- **Impact:** **Improved churn prediction accuracy.**  

#### **🔹 Challenge 4: Model Selection**  
- **Issue:** Needed a model balancing interpretability and performance.  
- **Solution:** Tested **Logistic Regression, Random Forest, XGBoost** → **XGBoost selected as best performer**.  
- **Impact:** **Final model achieved AUC-ROC Score of 0.8239**.  

#### **🔹 Challenge 5: Hyperparameter Optimization**  
- **Issue:** Default parameters led to **suboptimal recall and precision**.  
- **Solution:** Used **GridSearchCV** to optimize:  
  ✅ `learning_rate = 0.05`  
  ✅ `max_depth = 6`  
  ✅ `n_estimators = 200`  
  ✅ `scale_pos_weight = 2.5`  
- **Impact:** **AUC-ROC improved to 0.8346.**  

#### **🔹 Challenge 6: Threshold Optimization**  
- **Issue:** Default **0.5 threshold** missed many actual churners.  
- **Solution:** **Optimized threshold to 0.3334 using Precision-Recall Curve**.  
- **Impact:** **85% of churners now correctly identified, reducing business losses.**  

---

## **5️⃣ Model Explainability with SHAP (SHapley Additive Explanations)**  

### **1️⃣ Global Feature Importance**  
**Key Drivers of Churn:**  
📌 **Contract Type:** Month-to-month contracts significantly increase churn.  
📌 **Monthly Charges:** Customers paying **$90+ per month** are high-risk.  
📌 **Tech Support & Security:** Customers **without these services churn more**.  
📌 **Tenure:** New customers (<12 months) **more likely to churn**.  
📌 **AutoPayments:** Manual payment customers **churn at higher rates**.  

---

### **2️⃣ Business Impact & Recommendations**  
✅ **Reduce Churn for High-Risk Customers** → Offer discounts for high-bill customers.  
✅ **Encourage Long-Term Contracts** → Provide incentives for switching from month-to-month.  
✅ **Promote Support Services** → Offer free trials for **Tech Support & Security packages**.  
✅ **Target New Customers for Retention** → Proactive engagement for **tenure < 12 months**.  
✅ **Encourage AutoPayments** → Offer bonuses for switching to **automatic billing**.  

---

## **5️⃣ Power BI Dashboard** 

To **effectively visualize churn trends and key insights**, a **Power BI dashboard** was developed. The dashboard highlights **customer segments, churn risks, financial impact, and service usage patterns** to support strategic decision-making.

### **📊 Dashboard Overview**  
The dashboard consists of **seven key sections** providing actionable insights into customer churn:

1️⃣ **Churn Overview** – High-level KPIs of churn probability, customer base, and revenue impact.  
2️⃣ **Churn Risk Distribution** – Identifies customer segments at high risk of churning.  
3️⃣ **Customer Segments & Churn Rate** – Examines churn rates based on contract type, payment method, and billing preferences.  
4️⃣ **Service Usage & Churn Impact** – Evaluates how internet service type, streaming, and support services affect churn.  
5️⃣ **Financial Factors & Churn** – Analyzes churn trends related to monthly and total charges.  
6️⃣ **Demographics & Churn** – Highlights churn differences by **senior status, gender, and partner status**.  
7️⃣ **High-Risk Customer List** – Identifies customers who require proactive engagement to reduce churn.  

---

### **📌 Key Insights from the Power BI Dashboard**  

### **1️⃣ Churn Overview**  
✅ **Average Churn Probability:** **38%** (Higher than expected, signaling a retention issue).  
✅ **Average Monthly Charges for Churned Customers:** **$64.76** → Higher-paying customers are at risk.  
✅ **Churn Risk Breakdown:**  
   - **High Risk:** **52.45%**  
   - **Medium Risk:** **29.14%**  
   - **Low Risk:** **18.42%**  

**💡 Business Impact:**  
- **Early intervention** is needed for high-risk customers.  
- **Targeted retention offers** could help mitigate churn among high-paying customers.  

---

### **2️⃣ Churn Risk Distribution**  
✅ **Month-to-month contract holders are the highest churn risk group (~42.71%).**  
✅ **Churn probability decreases as customer tenure increases.**  
✅ **Low-risk customers tend to have long-term contracts.**  

**💡 Business Impact:**  
- **Incentivizing long-term contracts** could reduce churn.  
- **Customer onboarding & early engagement** are key for new customers.  

---

### **3️⃣ Customer Segments & Churn Rate**  
✅ **Contract Type:** Month-to-month customers churn significantly more than yearly contract holders.  
✅ **Billing Preference:** Customers using **paperless billing and manual payments** are at higher churn risk.  
✅ **Support Services:** Customers without **Tech Support or Online Security** are more likely to leave.  

**💡 Business Impact:**  
- **Upsell long-term contracts to month-to-month customers.**  
- **Promote auto-payments and incentives for tech support services.**  

---

### **4️⃣ Service Usage & Churn Impact**  
✅ **Fiber Optic users have the highest churn rate (~41.89%).**  
✅ **Streaming Service Users churn more, possibly due to cost concerns.**  
✅ **Tech Support & Online Security lower churn risk.**  

**💡 Business Impact:**  
- **Reevaluate pricing strategy for Fiber Optic services.**  
- **Offer support service bundles to retain high-risk customers.**  

---

### **5️⃣ Financial Factors & Churn**  
✅ **Higher monthly charges correlate with increased churn risk.**  
✅ **Customers with lower total charges tend to churn more.**  

**💡 Business Impact:**  
- **Introduce loyalty rewards for high-paying customers.**  
- **Offer discounts or flexible pricing plans for at-risk customers.**  

---

### **6️⃣ Demographics & Churn**  
✅ **Senior citizens churn at a significantly higher rate (41.68%).**  
✅ **Churn rate is slightly higher among females than males.**  
✅ **Customers without a partner are more likely to leave.**  

**💡 Business Impact:**  
- **Create tailored plans for senior citizens.**  
- **Consider personalized retention strategies based on household status.**  

---

 ## **6 API Deployment **

## Overview  
After completing data processing, feature engineering, and training our churn prediction model, we deployed the model as a **REST API** to enable **real-time churn predictions**. The API allows users to send customer data and receive a **churn probability score** along with a **final churn prediction**.

---

## Deployment Platform  
The API is deployed using **Render**, a cloud platform that allows **easy and free hosting** for Python-based applications.

---

## 🛠 Tech Stack  
**Flask** – Lightweight web framework for creating REST APIs.  
**Gunicorn** – WSGI HTTP server for running the Flask application in production.  
**Render** – Cloud deployment service for hosting the API.  
**GitHub** – Version control system for managing project updates.  

---

## 🔧 Deployment Process  

### **1. Model & Threshold Saving**  
Before deployment, we **saved the trained model** and the **optimized decision threshold**, ensuring they could be **loaded by the API** for making predictions.  

### **2. API Development**  
We built a **Flask API** to expose an endpoint for predictions, allowing customer data to be sent as **JSON** and receive **predictions** in return.  

### **3. Dependencies Management**  
A `requirements.txt` file was created to **ensure all necessary dependencies** (Flask, joblib, pandas, numpy, scikit-learn, xgboost, etc.) were installed during deployment.  

### **4. Version Control with GitHub**  
The **API code and model files** were pushed to a **GitHub repository** for version control and deployment automation.  

### **5. Deploying on Render**  
**Created a new web service** on Render.  
**Connected the GitHub repository** containing the API.  
**Set up build commands** to install dependencies.  
**Configured the start command** to run the API using Gunicorn.  
**Successfully deployed**, making the API publicly accessible.  

---

## API Endpoint  
The API is **live** at:  
➡ **[https://churn-api.onrender.com/]([https://churn-api.onrender.com/])** 

It **accepts POST requests** with customer data and **returns churn predictions**.

---

## Final Outcome  
The **API is successfully deployed** and accessible.  
Users can **send customer data** and receive **real-time churn predictions**.  
The deployment ensures **scalability and automation**.  

---

## Next Steps  
**Implement authentication** to secure the API.  
**Add logging and monitoring** for API requests.  
**Optimize deployment** for better performance and scalability.  

---

# 7. Key Takeaways & Business Insights  

**Churn prediction is crucial for business profitability.**  
By identifying at-risk customers early, businesses can **proactively engage them** and reduce **churn-related revenue losses**.  

**Long-term contracts reduce churn.**  
Encouraging customers to move from **month-to-month** to **annual contracts** significantly improves **retention**.  

**Auto-payment methods reduce churn risk.**  
Customers paying via **Electronic Check** have the **highest churn rate**, while those using **Credit Cards & Bank Transfers** stay longer.  

**Pricing and service bundles matter.**  
Customers with **higher monthly charges** and **no add-on services** are **more likely to churn**. Offering **discounts** and **bundled services** can **increase retention**.  

**Early intervention is key.**  
Customers with **less than 18 months of tenure** are at the **highest risk**. Businesses must focus on **onboarding experiences, engagement programs, and personalized offers**.  

---

# How to Use the API  

### ** 1. Send a POST request with customer data in JSON format.**  
The API **returns churn predictions** based on the input data.

### ** 2. Response Structure**  
- **Churn Probability:** A score between `0 - 1` indicating churn likelihood.  
- **Final Prediction:** `"Yes"` (high risk) or `"No"` (low risk).  

---

### **Example Request**  
```json
{
    "SeniorCitizen": 0,
    "Partner": 1,
    "Dependents": 0,
    "tenure": 12,
    "MonthlyCharges": 75.5,
    "TotalCharges": 900,
    "Contract": "Month-to-month",
    "PaymentMethod": "Electronic Check"
}

## Example Response  
```json
{
    "churn_probability": 0.78,
    "final_prediction": "Yes"
}

Future Improvements
**Expand API functionality** – Add features such as real-time customer segmentation and customized retention recommendations.
**Integrate with CRM systems** – Automate churn risk alerts for businesses using Salesforce or HubSpot.
**Deploy a web dashboard** – Allow users to upload CSV data and visualize churn predictions and customer trends.
**Enhance model accuracy** – Experiment with deep learning models and feature selection techniques to further refine predictions.

Built with
SQL | Python | XGBoost | Flask API | Power BI | Render

---

