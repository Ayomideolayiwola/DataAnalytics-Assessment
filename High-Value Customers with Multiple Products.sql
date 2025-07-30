SELECT 
    s.owner_id,
    CONCAT(u.first_name, " ", u.last_name) AS name,
    COUNT(CASE WHEN p.is_a_fund = 1 THEN 1 END) AS investment_count,
    COUNT(CASE WHEN p.is_regular_savings = 1 THEN 1 END) AS savings_count,
    SUM(p.amount) as total_deposits
FROM users_customuser  u
JOIN savings_savingsaccount s
ON u.id= s.owner_id
JOIN plans_plan p
ON p.id= s.plan_id
GROUP BY s.owner_id, name
HAVING SUM(CASE WHEN p.is_regular_savings = 1 AND s.amount > 0 THEN 1 ELSE 0 END) >= 1
      AND SUM(CASE WHEN p.is_a_fund = 1 AND s.amount > 0 THEN 1 ELSE 0 END) >= 1 
ORDER BY total_deposits DESC;
