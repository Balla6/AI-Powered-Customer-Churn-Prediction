# AI-Powered Customer Churn Prediction  

**Author:** Balla Diaite  
**Role:** Data Analyst | Data Scientist  

**Project Overview:**  
This project builds a **data-driven churn prediction system** to help businesses identify at-risk customers, understand churn drivers, and implement effective retention strategies. By leveraging **SQL, machine learning, and business intelligence tools**, we transform raw customer data into actionable insights.  

---

## Table of Contents  

- [1. Data Collection & Cleaning](#-data-collection--cleaning)  
- [2️. SQL-Based Exploratory Data Analysis (EDA)](#-sql-based-exploratory-data-analysis-eda)  
- [3️. Python-Based Exploratory Data Analysis (EDA)](#-python-based-exploratory-data-analysis-eda)  
- [4️. Feature Engineering & Machine Learning](#-feature-engineering--machine-learning)  
- [5️. Power BI Dashboard](#-power-bi-dashboard)  
- [6️. API Deployment](#-api-deployment)  
- [7️. Key Takeaways & Business Insights](#-key-takeaways--business-insights)  
- [How to Use the API](#-how-to-use-the-api)  
- [Future Improvements](#-future-improvements)  

---

## 1. Data Collection & Cleaning  

A **high-quality dataset** is crucial for any predictive model. This project uses the **[Telco Customer Churn dataset](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)** from Kaggle, which contains customer demographics, service usage, billing details, and churn labels.  

### **Key Preprocessing Steps:**  
**Data Standardization:** Categorical values converted into machine-readable format.  
**Missing Value Treatment:** Missing TotalCharges values replaced to maintain data integrity.  
**Feature Encoding:** Yes/No responses converted to binary format.  
**Data Type Optimization:** Ensured proper numerical and categorical data formats.  
**Unnecessary Columns Removed:** customerID dropped for efficiency.  
**Final Dataset Saved:** Processed dataset stored for further analysis.  

---

## 2. SQL-Based Exploratory Data Analysis (EDA)  

This phase leverages **SQL to uncover key churn patterns**, segment customers, and assess the financial impact of churn.  

### **Key Findings & Business Impact**  
**High churn rate (26.54%)**, with **month-to-month contracts** showing the highest churn (42.71%).  
**Fiber Optic users churn the most (41.89%)**, potentially due to cost concerns.  
**Customers paying via Electronic Check (45.29% churn rate)** are at higher risk.  
**Churned customers pay higher monthly charges ($74.44) but have shorter tenures (18 months).**  
**Senior citizens churn more (41.68%)**, possibly due to pricing sensitivity.  

**Retention Recommendations:** Encourage **long-term contracts**, optimize **pricing models**, promote **auto-payments**, and implement **proactive early retention efforts**.

---

## 3. Python-Based Exploratory Data Analysis (EDA)  

This section leverages **Python (Matplotlib & Seaborn) to visualize churn trends**, identify customer behavior patterns, and validate SQL-based findings.

### **Key Findings & Business Impact**  
**Churn Distribution**: 1 in 4 customers leave → **Stronger engagement programs needed**.  
**Tenure & Churn**: Most churned customers leave **within 18 months** → **Early retention strategies crucial**.  
**Pricing Sensitivity**: Churned customers have **higher monthly charges ($74) than retained ones ($61)** → **Discounted long-term plans could help**.  
**Contract Type & Churn**: **Month-to-month contracts drive the highest churn** → **Encourage annual contracts**.  
**Payment Method & Churn**: **Electronic Check users churn most (~45%)** → **Promote automated payments**.  
**Feature Correlation**: Tenure and contract type are **strongest churn predictors** → **Customer longevity is key**.  

**Retention Recommendations:** Introduce **contract-based incentives**, offer **targeted discounts**, improve **customer onboarding**, and promote **auto-payments**.

---

## 4. Feature Engineering & Machine Learning  

### **1. Problem Statement**  
Customer churn is a **critical issue** in subscription-based businesses, impacting revenue and retention. The objective of this phase was to build a **high-performing machine learning model** that accurately predicts churn.  

**Key Challenges Addressed:**  
Handling **missing values** and incorrect data types.  
**Feature engineering** to create meaningful variables.  
**Balancing class imbalance** to prevent biased predictions.  
Choosing a **model that optimizes precision, recall, and interpretability**.  
Fine-tuning **hyperparameters** for the best performance.  

---

### **2. Key Challenges & Solutions**  

#### **Challenge 1: Data Cleaning & Handling Missing Values**  
- **Issue:** TotalCharges contained missing values, and categorical variables were not encoded.  
- **Solution:** Converted TotalCharges to numeric, encoded categorical variables, and created **AutoPayment flag**.  
- **Impact:** **Ensured model interpretability and consistency.**  

#### **Challenge 2: Feature Engineering**  
- **Issue:** Raw data lacked behavioral insights.  
- **Solution:** Created new **meaningful features**:  
  TenureCategory (Short, Medium, Long-term customers).  
  MonthlyChargesCategory (Low, Medium, High, Very High spending).  
  SupportServices (Bundled security & tech support).  
  AutoPayment (Manual vs. Automatic payments).  
- **Impact:** **Enhanced model performance and business explainability.**  

#### **Challenge 3: Class Imbalance**  
- **Issue:** **Only 26.5% of customers churned**, causing model bias.  
- **Solution:** Applied **SMOTE (Synthetic Minority Oversampling Technique)** to rebalance dataset.  
- **Impact:** **Improved churn prediction accuracy.**  

#### **Challenge 4: Model Selection**  
- **Issue:** Needed a model balancing interpretability and performance.  
- **Solution:** Tested **Logistic Regression, Random Forest, XGBoost** → **XGBoost selected as best performer**.  
- **Impact:** **Final model achieved AUC-ROC Score of 0.8239**.  

#### **Challenge 5: Hyperparameter Optimization**  
- **Issue:** Default parameters led to **suboptimal recall and precision**.  
- **Solution:** Used **GridSearchCV** to optimize:  
  learning_rate = 0.05  
  max_depth = 6  
  n_estimators = 200  
  scale_pos_weight = 2.5  
- **Impact:** **AUC-ROC improved to 0.8346.**  

#### **Challenge 6: Threshold Optimization**  
- **Issue:** Default **0.5 threshold** missed many actual churners.  
- **Solution:** **Optimized threshold to 0.3334 using Precision-Recall Curve**.  
- **Impact:** **85% of churners now correctly identified, reducing business losses.**  

---

## **5. Model Explainability with SHAP (SHapley Additive Explanations)**  

### **1. Global Feature Importance**  
**Key Drivers of Churn:**  
**Contract Type:** Month-to-month contracts significantly increase churn.  
**Monthly Charges:** Customers paying **$90+ per month** are high-risk.  
**Tech Support & Security:** Customers **without these services churn more**.  
**Tenure:** New customers (<12 months) **more likely to churn**.  
**AutoPayments:** Manual payment customers **churn at higher rates**.  

---

### **2. Business Impact & Recommendations**  
**Reduce Churn for High-Risk Customers** → Offer discounts for high-bill customers.  
**Encourage Long-Term Contracts** → Provide incentives for switching from month-to-month.  
**Promote Support Services** → Offer free trials for **Tech Support & Security packages**.  
**Target New Customers for Retention** → Proactive engagement for **tenure < 12 months**.  
**Encourage AutoPayments** → Offer bonuses for switching to **automatic billing**.  

---

## **5. Power BI Dashboard** 

To **effectively visualize churn trends and key insights**, a **Power BI dashboard** was developed. The dashboard highlights **customer segments, churn risks, financial impact, and service usage patterns** to support strategic decision-making.

### **Dashboard Overview**  
The dashboard consists of **seven key sections** providing actionable insights into customer churn:

1.**Churn Overview** – High-level KPIs of churn probability, customer base, and revenue impact.  
2.**Churn Risk Distribution** – Identifies customer segments at high risk of churning.  
3.**Customer Segments & Churn Rate** – Examines churn rates based on contract type, payment method, and billing preferences.  
4.**Service Usage & Churn Impact** – Evaluates how internet service type, streaming, and support services affect churn.  
5.**Financial Factors & Churn** – Analyzes churn trends related to monthly and total charges.  
6.**Demographics & Churn** – Highlights churn differences by **senior status, gender, and partner status**.  

**Access the Power BI dashboard here: [Interactive Power BI Dashboard](https://app.powerbi.com/groups/me/reports/828c5435-922e-40da-b9f0-d2e3fb6bfc49/593d6c111b41dd6473d0?experience=power-bi)**

---

### **Key Insights from the Power BI Dashboard**  

### **1. Churn Overview**  
**Average Churn Probability:** **38%** (Higher than expected, signaling a retention issue).  
**Average Monthly Charges for Churned Customers:** **$64.76** → Higher-paying customers are at risk.  
**Churn Risk Breakdown:**  
   - **High Risk:** **52.45%**  
   - **Medium Risk:** **29.14%**  
   - **Low Risk:** **18.42%**  

**Business Impact:**  
- **Early intervention** is needed for high-risk customers.  
- **Targeted retention offers** could help mitigate churn among high-paying customers.  

---

### **2. Churn Risk Distribution**  
**Month-to-month contract holders are the highest churn risk group (~42.71%).**  
**Churn probability decreases as customer tenure increases.**  
**Low-risk customers tend to have long-term contracts.**  

**Business Impact:**  
- **Incentivizing long-term contracts** could reduce churn.  
- **Customer onboarding & early engagement** are key for new customers.  

---

### **3. Customer Segments & Churn Rate**  
**Contract Type:** Month-to-month customers churn significantly more than yearly contract holders.  
**Billing Preference:** Customers using **paperless billing and manual payments** are at higher churn risk.  
**Support Services:** Customers without **Tech Support or Online Security** are more likely to leave.  

**Business Impact:**  
- **Upsell long-term contracts to month-to-month customers.**  
- **Promote auto-payments and incentives for tech support services.**  

---

### **4. Service Usage & Churn Impact**  
**Fiber Optic users have the highest churn rate (~41.89%).**  
**Streaming Service Users churn more, possibly due to cost concerns.**  
**Tech Support & Online Security lower churn risk.**  

**Business Impact:**  
- **Reevaluate pricing strategy for Fiber Optic services.**  
- **Offer support service bundles to retain high-risk customers.**  

---

### **5. Financial Factors & Churn**  
**Higher monthly charges correlate with increased churn risk.**  
**Customers with lower total charges tend to churn more.**  

**Business Impact:**  
- **Introduce loyalty rewards for high-paying customers.**  
- **Offer discounts or flexible pricing plans for at-risk customers.**  

---

### **6. Demographics & Churn**  
**Senior citizens churn at a significantly higher rate (41.68%).**  
**Churn rate is slightly higher among females than males.**  
**Customers without a partner are more likely to leave.**  

**Business Impact:**  
- **Create tailored plans for senior citizens.**  
- **Consider personalized retention strategies based on household status.**
---

## **6. API Deployment**  
The trained model is deployed as a **REST API** to enable **real-time churn predictions**.  

### **Deployment Details:**  
- **Platform:** Hosted on **Render**.  
- **Frameworks:** Flask, Gunicorn.  
- **Version Control:** Managed with GitHub.  

### **API Endpoint:**  
➡ [https://churn-api.onrender.com/](https://churn-api.onrender.com/)  

#### **Example API Request:**  
```
import requests

url = "https://churn-api.onrender.com/predict"
data = {
    "SeniorCitizen": 0,
    "Partner": 1,
    "Dependents": 0,
    "tenure": 12,
    "PhoneService": 1,
    "MultipleLines": 0,
    "InternetService": 1,
    "OnlineSecurity": 0,
    "OnlineBackup": 1,
    "DeviceProtection": 1,
    "TechSupport": 1,
    "StreamingTV": 0,
    "StreamingMovies": 1,
    "Contract": 0,
    "PaperlessBilling": 1,
    "MonthlyCharges": 75.0,
    "TotalCharges": 1800.5,
    "AutoPayment": 1,
    "SupportServices": 1,
    "gender_Male": 1,
    "TenureCategory_Medium-term": 1,
    "TenureCategory_Long-term": 0,
    "MonthlyChargesCategory_Medium": 1,
    "MonthlyChargesCategory_High": 0,
    "MonthlyChargesCategory_Very High": 0,
    "AvgMonthlySpend": 75.0,
    "LogTotalCharges": 7.2,
    "Monthly_Tenure": 1800.5,
    "Support_TotalCharges": 200.0
}

response = requests.post(url, json=data)
print(response.json())

```  

#### **Example API Response:**  
```
{'churn_probability': 0.4114, 'final_prediction': 'Churn'}
```  

---  
## **7. Key Takeaways & Business Insights**  
**Long-term contracts reduce churn** – Encourage annual contracts.  
**Auto-payment methods lower churn risk** – Promote credit card & bank transfers.  
**High-bill customers are at risk** – Offer loyalty rewards and discounts.  
**Early intervention is crucial** – Focus on **new customers (<18 months tenure)**.  

---  
## **8. Future Improvements**  
- **Enhance API Security:** Implement authentication mechanisms.  
- **CRM Integration:** Automate churn risk alerts for businesses.  
- **Web Dashboard:** Enable CSV uploads for interactive churn analysis.  
- **Model Refinement:** Experiment with deep learning techniques.  

---  
## **Built With:**  
   **SQL | Python | XGBoost | Flask API | Power BI | Render**  
---  
