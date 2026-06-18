CREATE DATABASE credit_card_fraud;
USE credit_card_fraud;
SELECT COUNT(*) AS Total_Transactions
FROM credit_card_fraud_clean;
SELECT COUNT(*) AS Fraud_Transactions
FROM credit_card_fraud_clean
WHERE Class = 1;
SELECT COUNT(*) AS Genuine_Transactions
FROM credit_card_fraud_clean
WHERE Class = 0;
SELECT ROUND(
(COUNT(CASE WHEN Class = 1 THEN 1 END) * 100.0) /
COUNT(*),
4
) AS Fraud_Rate_Percentage
FROM credit_card_fraud_clean;
SELECT ROUND(SUM(Amount),2) AS Total_Transaction_Amount
FROM credit_card_fraud_clean;
SELECT ROUND(AVG(Amount),2) AS Average_Transaction_Amount
FROM credit_card_fraud_clean;
SELECT
MAX(Amount) AS Highest_Transaction,
MIN(Amount) AS Lowest_Transaction
FROM credit_card_fraud_clean;
SELECT
COUNT(*) AS Fraud_Count,
ROUND(SUM(Amount),2) AS Fraud_Amount
FROM credit_card_fraud_clean
WHERE Class = 1;
SELECT
id,
Amount
FROM credit_card_fraud_clean
ORDER BY Amount DESC
LIMIT 10;
SELECT
CASE
    WHEN Amount < 100 THEN 'Low'
    WHEN Amount BETWEEN 100 AND 1000 THEN 'Medium'
    ELSE 'High'
END AS Risk_Category,
COUNT(*) AS Transactions
FROM credit_card_fraud_clean
GROUP BY Risk_Category;
SHOW TABLES;
SELECT
Class,
ROUND(AVG(Amount),2) AS Average_Amount
FROM credit_card_fraud_clean
GROUP BY Class;
SELECT
CASE
WHEN Amount < 100 THEN 'Below 100'
WHEN Amount BETWEEN 100 AND 1000 THEN '100-1000'
ELSE 'Above 1000'
END AS Amount_Range,
COUNT(*) AS Fraud_Transactions
FROM credit_card_fraud_clean
WHERE Class = 1
GROUP BY Amount_Range;
SELECT
id,
Amount
FROM credit_card_fraud_clean
WHERE Class = 1
ORDER BY Amount DESC
LIMIT 10;