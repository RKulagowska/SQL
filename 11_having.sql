SELECT employee_id, 
	   SUM(amount) AS Total_Sales,
	   COUNT(employee_id) AS Transactions
FROM sales_2022 
GROUP BY employee_id
ORDER BY employee_id DESC;

SELECT employee_id, 
	   SUM(amount) AS Total_Sales,
	   COUNT(employee_id) AS Transactions
FROM sales_2022 
WHERE employee_id != 336
GROUP BY employee_id
HAVING Total_Sales >50
ORDER BY employee_id DESC;