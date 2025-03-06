USE aiproject;
SELECT * FROM churn_data LIMIT 5;

-- Step 1: Data Integrity Check
-- Check Total Rows in the Dataset
SELECT COUNT(*) AS total_rows FROM churn_data;

-- Check for Missing Values
SELECT 
    COUNT(*) - COUNT(SeniorCitizen) AS missing_SeniorCitizen,
    COUNT(*) - COUNT(Partner) AS missing_Partner,
    COUNT(*) - COUNT(Dependents) AS missing_Dependents,
    COUNT(*) - COUNT(tenure) AS missing_tenure,
    COUNT(*) - COUNT(InternetService) AS missing_InternetService,
    COUNT(*) - COUNT(Contract) AS missing_Contract,
    COUNT(*) - COUNT(TotalCharges) AS missing_TotalCharges
FROM churn_data;

-- Check for Duplicate Records
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

-- Step 2: Customer Churn Analysis
-- Overall Churn Rate
SELECT 
    Churn,
    COUNT(*) AS Count, 
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM churn_data), 2) AS Percentage
FROM churn_data
GROUP BY Churn; 
-- Output: 
-- 0 has 5174 count and 78.46%
-- 1 has 1869 count and 26.54%

-- Churn Rate by Contract Type
SELECT 
    Contract, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY Contract), 2) AS Churn_Percentage
FROM churn_data
GROUP BY Contract, Churn
ORDER BY Contract, Churn DESC;
-- Output:
-- Month-to-month	churn=0	   count=2220	57.29%
-- Month-to-month	churn=1	   count=1655	42.71%
-- One year	        churn=0	   count=1307	88.73%
-- One year	        churn=1	   count=166	11.27%
-- Two year	        churn=0	   count=1647	97.17%
-- Two year	        churn=1	   count=48	    2.83%

-- Churn Rate by Internet Service
SELECT 
    InternetService, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY InternetService), 2) AS Churn_Percentage
FROM churn_data
GROUP BY InternetService, Churn
ORDER BY InternetService, Churn;
-- Output:
-- 0	churn=1	  count=113	    7.40%
-- 1	churn=0	  count=1962	81.04%
-- 1	churn=1	  count=459	    18.96%
-- 2	churn=0	  count=1799	58.11%
-- 2	churn=1	  count=1297	41.89% 

-- Churn Rate by Payment Method
SELECT 
    PaymentMethod, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY PaymentMethod), 2) AS Churn_Percentage
FROM churn_data
GROUP BY PaymentMethod, Churn
ORDER BY PaymentMethod, Churn;
-- Output:
-- Bank transfer (automatic)	churn=0	  count=1286	83.29%
-- Bank transfer (automatic)	churn=1	  count=258	    16.71%
-- Credit card (automatic)	    churn=0	  count=1290	84.76%
-- Credit card (automatic)	    chrun=1	  count=232	    15.24%
-- Electronic check	            churn=0	  count=1294	54.71%
-- Electronic check	            churn=1	  count=1071	45.29%
-- Mailed check	                churn=0	  count=1304	80.89%
-- Mailed check	                churn=1	  count=308	    19.11%

-- Step 3: Financial Impact Analysis
-- Monthly Charges vs. Churn
SELECT 
    Churn, 
    ROUND(AVG(MonthlyCharges), 2) AS Avg_MonthlyCharges
FROM churn_data
GROUP BY Churn;
-- Output:
-- 0	Avg_MonthlyCharges: 61.27
-- 1	Avg_MonthlyCharges: 74.44

-- Total Revenue Lost Due to Churn
SELECT 
    ROUND(SUM(TotalCharges), 2) AS Lost_Revenue
FROM churn_data
WHERE Churn = 1;
-- Output:
-- Lost_Revenue: 2862926.9

-- Revenue Distribution by Contract Type
SELECT 
    Contract, 
    ROUND(SUM(TotalCharges), 2) AS Total_Revenue
FROM churn_data
GROUP BY Contract;
-- Output
-- Month-to-month	Total_Revenue: 5305861.5
-- One year	        Total_Revenue: 4467053.5
-- Two year	        Total_Revenue: 6283253.7

-- Step 4: Customer Behavior Insights
-- Tenure vs. Churn
SELECT 
    Churn, 
    ROUND(AVG(tenure), 2) AS Avg_Tenure
FROM churn_data
GROUP BY Churn;
-- Output
-- churn: 0	 Avg_Tenure: 37.57
-- churn: 1	 Avg_Tenure: 17.98

-- Churn Rate by Senior Citizen Status
SELECT 
    SeniorCitizen, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY SeniorCitizen), 2) AS Churn_Percentage
FROM churn_data
GROUP BY SeniorCitizen, Churn
ORDER BY SeniorCitizen, Churn;
-- Output:
-- SeniorCitizen: 0	 churn=0	 count=4508	 churn_Percentage: 76.39
-- SeniorCitizen: 0	 churn=1	 count=1393	 churn_Percentage: 23.61
-- SeniorCitizen: 1	 churn=0	 count=666	 churn_Percentage: 58.32
-- SeniorCitizen: 1	 churn=1	 count=476	 churn_Percentage: 41.68

-- Churn Rate by Streaming Services
SELECT 
    StreamingTV, 
    Churn, 
    COUNT(*) AS Count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY StreamingTV), 2) AS Churn_Percentage
FROM churn_data
GROUP BY StreamingTV, Churn
ORDER BY StreamingTV, Churn;
-- Output:
-- StreamingTV: 0	churn=0	 count=3281	 Churn_Percentage: 75.67
-- StreamingTV: 0	churn=1	 count=1055	 Churn_Percentage: 24.33
-- StreamingTV: 1	churn=0	 count=1893	 Churn_Percentage: 69.93
-- StreamingTV: 1	churn=1	 count=814	 Churn_Percentage: 30.07

-- Step 5: Feature Importance for Churn
SELECT 
    'Tenure' AS Feature, ROUND(AVG(tenure), 2) AS Avg_Churn_Value FROM churn_data WHERE Churn = 1
UNION ALL
SELECT 
    'MonthlyCharges', ROUND(AVG(MonthlyCharges), 2) FROM churn_data WHERE Churn = 1
UNION ALL
SELECT 
    'TotalCharges', ROUND(AVG(TotalCharges), 2) FROM churn_data WHERE Churn = 1;
-- Output:
-- Tenure	        Avg_Churn_Value : 17.98
-- MonthlyCharges	Avg_Churn_Value : 74.44
-- TotalCharges	    Avg_Churn_Value : 1531.8


