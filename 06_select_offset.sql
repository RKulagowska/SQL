SELECT ProductName, UnitPrice FROM Product;

SELECT ProductName, UnitPrice FROM Product ORDER BY UnitPrice Limit 5 OFFSET 3;
SELECT ProductName, UnitPrice FROM Product ORDER BY UnitPrice DESC Limit 1 OFFSET 4;

SELECT ProductName, 
	   UnitPrice 
FROM Product 
ORDER BY UnitPrice DESC 
Limit 1 OFFSET 4;