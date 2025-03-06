# AI-Powered Customer Churn Prediction  

## **Author:** Balla Diaite  
**Role:** Data Analyst | Data Scientist  

## **Project Overview**  
This project develops a **data-driven customer churn prediction system** to help businesses identify at-risk customers, understand churn drivers, and implement effective retention strategies. Using **SQL, machine learning, and business intelligence tools**, raw customer data is transformed into actionable insights.  

---  
## **Table of Contents**  

1. [Data Collection & Cleaning](#data-collection--cleaning)  
2. [SQL-Based Exploratory Data Analysis (EDA)](#sql-based-exploratory-data-analysis-eda)  
3. [Python-Based Exploratory Data Analysis (EDA)](#python-based-exploratory-data-analysis-eda)  
4. [Feature Engineering & Machine Learning](#feature-engineering--machine-learning)  
5. [Power BI Dashboard](#power-bi-dashboard)  
6. [API Deployment](#api-deployment)  
7. [Key Takeaways & Business Insights](#key-takeaways--business-insights)  
8. [How to Use the API](#how-to-use-the-api)  
9. [Future Improvements](#future-improvements)  

---  
## **1. Data Collection & Cleaning**  
A **high-quality dataset** is essential for predictive modeling. This project utilizes the **[Telco Customer Churn dataset](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)** from Kaggle, which includes customer demographics, service usage, billing details, and churn labels.  

### **Key Preprocessing Steps:**  
- **Data Standardization:** Converted categorical values into machine-readable formats.  
- **Missing Value Treatment:** Replaced missing `TotalCharges` values to maintain data integrity.  
- **Feature Encoding:** Transformed Yes/No responses into binary format.  
- **Data Type Optimization:** Ensured appropriate numerical and categorical data types.  
- **Feature Selection:** Removed unnecessary columns (`customerID`) for efficiency.  
- **Final Dataset Storage:** Processed data saved for further analysis.  

---  
## **2. SQL-Based Exploratory Data Analysis (EDA)**  
SQL was used to uncover key churn patterns, segment customers, and evaluate the financial impact of churn.  

### **Key Findings & Business Impact:**  
- **High churn rate (26.54%)** – Month-to-month contracts show the highest churn (42.71%).  
- **Fiber Optic users churn the most (41.89%)** – Potential cost-related concerns.  
- **Electronic Check payments show the highest churn rate (45.29%)** – Indicates unreliable customer retention.  
- **Senior citizens exhibit a 41.68% churn rate** – Pricing sensitivity may play a role.  

### **Retention Strategies:**  
- Encourage **long-term contracts** and **automated payments**.  
- Optimize **pricing models** to retain high-risk customers.  
- Implement **proactive early retention efforts** for at-risk groups.  

---  
## **3. Python-Based Exploratory Data Analysis (EDA)**  
Python libraries such as **Matplotlib and Seaborn** were used to visualize churn trends and validate SQL-based findings.  

### **Key Insights:**  
- **Tenure & Churn:** Customers churn **within 18 months** – Early intervention is crucial.  
- **Pricing Sensitivity:** Churned customers pay **higher monthly charges ($74) than retained ones ($61)**.  
- **Contract Type & Churn:** Month-to-month contracts drive the highest churn.  
- **Payment Method & Churn:** Electronic Check users churn most (~45%).  

**Recommendations:** Introduce **contract-based incentives**, targeted **discounts**, improved **customer onboarding**, and **auto-payment promotions**.  

---  
## **4. Feature Engineering & Machine Learning**  

### **1. Problem Statement**  
Customer churn negatively impacts revenue and retention. This phase focuses on building a **high-performance machine learning model** for accurate churn prediction.  

### **2. Challenges & Solutions**  

#### **Data Cleaning & Handling Missing Values**  
Converted `TotalCharges` to numeric and encoded categorical variables.  
Created an **AutoPayment** flag.  

#### **Feature Engineering**  
Developed new features like `TenureCategory`, `MonthlyChargesCategory`, `SupportServices`, and `AutoPayment`.  

#### **Class Imbalance**  
Applied **SMOTE (Synthetic Minority Oversampling Technique)** to balance the dataset.  

#### **Model Selection & Optimization**  
Compared **Logistic Regression, Random Forest, and XGBoost** – **XGBoost performed best (AUC-ROC = 0.8346).**  
Fine-tuned hyperparameters using **GridSearchCV**.  
Adjusted **threshold optimization** to improve recall.  

---  
## **5. Power BI Dashboard**  
A **Power BI dashboard** visualizes churn trends and key business insights.  

### **Dashboard Features:**  
- **Churn Overview:** High-level KPIs of churn probability, customer base, and revenue impact.  
- **Churn Risk Distribution:** Identifies customer segments at high risk.  
- **Service Usage & Churn Impact:** Analyzes how service types and support impact churn.  
- **Financial Analysis:** Evaluates the relationship between charges and churn.  

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
```  

#### **Example API Response:**  
```json  
{
    "churn_probability": 0.78,  
    "final_prediction": "Yes"  
}  
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
