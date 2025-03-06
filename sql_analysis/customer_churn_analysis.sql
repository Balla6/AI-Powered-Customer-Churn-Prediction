SELECT * FROM churn_data LIMIT 5;

-- Data Integrity Check
-- Total Rows in the Dataset
SELECT COUNT(*) AS total_rows FROM churn_data;

-- Checking for Missing Values
SELECT 
    COUNT(*) - COUNT(SeniorCitizen) AS missing_SeniorCitizen,
    COUNT(*) - COUNT(Partner) AS missing_Partner,
    COUNT(*) - COUNT(Dependents) AS missing_Dependents,
    COUNT(*) - COUNT(tenure) AS missing_tenure,
    COUNT(*) - COUNT(InternetService) AS missing_InternetService,
    COUNT(*) - COUNT(Contract) AS missing_Contract,
    COUNT(*) - COUNT(TotalCharges) AS missing_TotalCharges
FROM churn_data;

-- Checking for Duplicate Records
SELECT SeniorCitizen, Partner, Dependents, tenure, PhoneService, MultipleLines, 
       InternetService, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, 
       StreamingTV, StreamingMovies, Contract, PaperlessBilling, PaymentMethod, 
       MonthlyCharges, TotalCharges, Churn, COUNT(*) AS duplicate_count
FROM churn_data
GROUP BY SeniorCitizen, Partner, Dependents, tenure, PhoneService, MultipleLines, 
         InternetService, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, 
         StreamingTV, StreamingMovies, Contract, PaperlessBilling, PaymentMethod, 
         MonthlyCharges, TotalCharges, Churn
HAVING COUNT(*) > 1;

-- Customer Churn Analysis
-- Overall Churn Rate
SELECT 
    Churn,
    COUNT(*) AS Count, 
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM churn_data), 2) AS Percentage
FROM churn_data
GROUP BY Churn; 

-- Churn Rate by Contract Type
SELECT 
    Contract, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY Contract), 2) AS Churn_Percentage
FROM churn_data
GROUP BY Contract, Churn
ORDER BY Contract, Churn DESC;

-- Churn Rate by Internet Service
SELECT 
    InternetService, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY InternetService), 2) AS Churn_Percentage
FROM churn_data
GROUP BY InternetService, Churn
ORDER BY InternetService, Churn;

-- Churn Rate by Payment Method
SELECT 
    PaymentMethod, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PaymentMethod), 2) AS Churn_Percentage
FROM churn_data
GROUP BY PaymentMethod, Churn
ORDER BY PaymentMethod, Churn;

-- Financial Impact Analysis
-- Monthly Charges vs. Churn
SELECT 
    Churn, 
    ROUND(AVG(MonthlyCharges), 2) AS Avg_MonthlyCharges
FROM churn_data
GROUP BY Churn;

-- Total Revenue Lost Due to Churn
SELECT 
    ROUND(SUM(TotalCharges), 2) AS Lost_Revenue
FROM churn_data
WHERE Churn = 1;

-- Revenue Distribution by Contract Type
SELECT 
    Contract, 
    ROUND(SUM(TotalCharges), 2) AS Total_Revenue
FROM churn_data
GROUP BY Contract;

-- Customer Behavior Insights
-- Tenure vs. Churn
SELECT 
    Churn, 
    ROUND(AVG(tenure), 2) AS Avg_Tenure
FROM churn_data
GROUP BY Churn;

-- Churn Rate by Senior Citizen Status
SELECT 
    SeniorCitizen, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY SeniorCitizen), 2) AS Churn_Percentage
FROM churn_data
GROUP BY SeniorCitizen, Churn
ORDER BY SeniorCitizen, Churn;

-- Churn Rate by Streaming Services
SELECT 
    StreamingTV, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY StreamingTV), 2) AS Churn_Percentage
FROM churn_data
GROUP BY StreamingTV, Churn
ORDER BY StreamingTV, Churn;

-- Feature Importance for Churn
SELECT 
    'Tenure' AS Feature, ROUND(AVG(tenure), 2) AS Avg_Churn_Value FROM churn_data WHERE Churn = 1
UNION ALL
SELECT 
    'MonthlyCharges', ROUND(AVG(MonthlyCharges), 2) FROM churn_data WHERE Churn = 1
UNION ALL
SELECT 
    'TotalCharges', ROUND(AVG(TotalCharges), 2) FROM churn_data WHERE Churn = 1;
