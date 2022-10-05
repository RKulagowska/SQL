-- utworzenie taabeli 

CREATE TABLE website.sales_2022(
	id			INTEGER PRIMARY KEY,
	employee_id INTEGER NOT NULL,
	amount		REAL   NOT NULL);
	
-- wstawianie rekordów do tabeli 

INSERT INTO website.sales_2022 (employee_id, amount)
VALUES  (325,109.0),
		(335,9.89),
		(336,40.0),
		(325,210.0),
		(336,39.50),
		(431,15.99),
		(325,10.99),
		(431,32.00);
		
SELECT * FROM sales_2022;

-- zapytanie poniżej zwróci tylko pierwsze wartości z grupy 
SELECT * FROM sales_2022 GROUP BY employee_id;

--
SELECT employee_id FROM sales_2022 GROUP BY employee_id;
SELECT employee_id, SUM(amount) FROM sales_2022 GROUP BY employee_id;

SELECT employee_id, 
	   SUM(amount) AS Total_Sales 
FROM sales_2022 
GROUP BY employee_id;

SELECT employee_id, 
	   SUM(amount) AS Total_Sales,
	   COUNT(employee_id) AS Transactions,
	   AVG(amount) AS Avg_amount, 
	   MIN(amount) AS Min_amount,
	   MAX(amount) AS Max_amount 
FROM sales_2022 
GROUP BY employee_id;

SELECT employee_id, 
	   SUM(amount) AS Total_Sales,
	   COUNT(employee_id) AS Transactions,
	   AVG(amount) AS Avg_amount, 
	   MIN(amount) AS Min_amount,
	   MAX(amount) AS Max_amount 
FROM sales_2022 
GROUP BY employee_id
ORDER BY employee_id DESC;
