-- Get the last inflow transaction date per plan
WITH last_inflows AS (
    SELECT plan_id,
           MAX(transaction_date) AS last_transaction_date
    FROM savings_savingsaccount
    GROUP BY plan_id
)
-- Select plans with no inflow in the past 365 days
SELECT p.id AS plan_id,
       p.owner_id,
       CASE WHEN p.is_regular_savings = 1 THEN 'savings' 
       WHEN p.is_a_fund = 1 THEN 'investment' 
       ELSE NULL END AS type,
	   l.last_transaction_date,
DATEDIFF(CURRENT_DATE(), l.last_transaction_date) AS inactivity_days
FROM plans_plan p
LEFT JOIN last_inflows l
ON p.id = l.plan_id
WHERE DATEDIFF(CURRENT_DATE(), l.last_transaction_date) > 365 
AND (p.is_regular_savings = 1 OR p.is_a_fund = 1)
ORDER BY inactivity_days;

