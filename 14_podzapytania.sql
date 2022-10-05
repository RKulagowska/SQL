SELECT * FROM Product;

SELECT * FROM Product WHERE UnitsInStock >0;

SELECT Id FROM Product WHERE UnitsInStock >0;

SELECT * 
FROM OrderDetail 
WHERE ProductId IN 
		(SELECT Id 
		FROM Product 
		WHERE UnitsInStock >0);
		
SELECT * FROM Customer;

SELECT Country FROM Customer WHERE Country Like 'U%';
SELECT DISTINCT Country FROM Customer WHERE Country Like 'U%';

SELECT Id FROM Customer WHERE Country Like 'U%';

SELECT * FROM 'Order';


SELECT * 
FROM 'Order' 
WHERE CustomerId IN 
		(SELECT Id 
		FROM Customer 
		WHERE Country Like 'U%');