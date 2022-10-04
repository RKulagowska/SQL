SELECT productName, UnitPrice FROM Product;

SELECT productName, UnitPrice FROM Product LIMIT 10;

SELECT productName, UnitPrice FROM Product ORDER BY UnitPrice LIMIT 10;

SELECT productName, UnitPrice FROM Product ORDER BY UnitPrice DESC LIMIT 10;

SELECT productName, 
	   UnitPrice 
FROM Product 
ORDER BY UnitPrice DESC 
LIMIT 2;