# DataAnalytics-Assessment

# DataAnalytics-Assessment

- Question 1
Approach
I began by identifying the key relationships across the three tables involved. Next, I filtered customers based on whether they had Investment Savings and Regular Savings accounts using a CASE statement for conditional classification. I then counted the occurrences of each savings type per customer and used the HAVING clause to filter results further. Finally, I calculated the total amount deposited by each customer into both savings plan types.

Challanges
Creating the correct conditions to identify savings plans vs. investment plans
Ensuring the CASE expressions correctly filtered for plan types without double-counting



- Question 2
Approach
I started by calculating the average monthly transactions per customer using a Common Table Expression (CTE). After verifying that the transaction_date column contained no null values, I proceeded to group customers based on their transaction frequency (e.g., high, medium, or low), using another CTE to define these categories from the first CTE. Finally, I combined the results to display each customer's average monthly transactions along with their corresponding frequency classification.

Challenges
The challenge i encountered is having to order by their frequency



- Question 3
Approach
A Common Table Expression (CTE) named last_inflows is used to retrieve the most recent transaction for each plan_id from the savings_savingsaccount table.
Each plan is then categorized as either savings or investment in the plans_plan table. Plans with a gap of more than 365 days since their last inflow are identified using the DATEDIFF() function. Only plans classified as savings or investment are included. The results are sorted by inactivity duration in descending order.

Challenges
The challenge i encountered is understanding the question well.


- Question 4
Approach
I calculated each customer’s tenure in months since account creation. Counted the total number of transactions per customer. Computed the average profit per transaction assuming 0.1% of the transaction value. Applied the CLV formula as given, then filtered out customers with zero-month period. A ranked list of customers with their tenure, total transactions, and estimated CLV, enabling data-driven marketing strategies and customer segmentation.

Challenges
I had to confirm that no null values existed in critical fields like transaction date and amount, as they could give the wrong average transaction value.
