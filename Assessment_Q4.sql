SELECT
    u.id AS customer_id,
    CONCAT(u.first_name, " ", u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, u.date_joined, CURRENT_DATE()) AS tenure_months,
    COUNT(*) AS total_transactions,
    -- CLV calculation
    ROUND(
        (COUNT(s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE())) * 12 * (AVG(s.amount) * 0.001),
        2) AS estimated_clv
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
GROUP BY u.id, u.name,u.date_joined
HAVING tenure_months > 0
ORDER BY estimated_clv DESC;





