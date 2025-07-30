 -- Calculate average monthly transactions per customer
WITH customer_monthly_transactions AS (
    SELECT s.owner_id,
           COUNT(s.id) /(
		  TIMESTAMPDIFF(MONTH, MIN(s.transaction_date), MAX(s.transaction_date)) + 1) AS avg_transactions_per_month
  FROM users_customuser u
   JOIN savings_savingsaccount s 
   ON u.id = s.owner_id
   GROUP BY s.owner_id
),
-- group customers based on transaction frequency
categorized_customers AS (
    SELECT  CASE
            WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
            WHEN avg_transactions_per_month >= 3 THEN 'Medium Frequency'
            ELSE 'Low Frequency' END AS frequency_category,
          avg_transactions_per_month
   FROM customer_monthly_transactions
)
SELECT frequency_category,
       COUNT(*) AS customer_count,
       ROUND(AVG(avg_transactions_per_month), 1) AS avg_transactions_per_month
FROM categorized_customers
GROUP BY frequency_category
ORDER BY CASE 
        WHEN frequency_category = 'High Frequency' THEN 1
        WHEN frequency_category = 'Medium Frequency' THEN 2
        WHEN frequency_category = 'Low Frequency' THEN 3
        END;
