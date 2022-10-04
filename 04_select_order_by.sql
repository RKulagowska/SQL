SELECT * FROM Employee;

SELECT * FROM Employee ORDER BY FirstName;

SELECT * FROM Employee ORDER BY FirstName DESC;

SELECT * FROM Employee ORDER BY title, FirstName;

SELECT * FROM Employee ORDER BY title ASC, FirstName DESC;

SELECT Title, FirstName, LastName FROM Employee ORDER BY 1 ASC, 2 DESC;

SELECT * FROM Product;

SELECT * FROM Product ORDER BY UnitPrice;

SELECT * FROM customer ORDER BY Fax;

SELECT CompanyName,ContactName, Fax FROM Customer ORDER BY Fax;

SELECT CompanyName,ContactName, Fax FROM Customer ORDER BY Fax NULLS LAST;

SELECT CompanyName,
		ContactName, 
		Fax 
FROM Customer 
ORDER BY Fax NULLS LAST;

