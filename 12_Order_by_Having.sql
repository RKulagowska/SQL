-- 1 zapytanie nie zadziała bo order jest również poleceniem więć używamy innej wersji np 2 lub 3 

SELECT * FROM Order;
SELECT * FROM 'Order';
SELECT * FROM [Order];

SELECT CustomerId FROM 'Order';
SELECT DISTINCT CustomerId FROM 'Order';

-- liczba rekordów dla każdego Customer ID
SELECT CustomerId,
	   Count(CustomerId) AS NumOfOrders 
FROM 'Order'
GROUP BY CustomerId
ORDER BY NumOfOrders DESC
LIMIT 10 OFFSET 3;


SELECT * From OrderDetail

SELECT OrderId, 
	   Count(OrderId) AS Num
From OrderDetail
GROUP BY OrderId
ORDER BY Num DESC

SELECT *
From OrderDetail
WHERE OrderId == 11077


SELECT *, UnitPrice *Quantity* (1-Discount) AS TotalSale
From OrderDetail;

SELECT OrderId, 
	   SUM( UnitPrice *Quantity* (1-Discount)) AS TotalSale
From OrderDetail
GROUP BY OrderId
ORDER BY TotalSale DESC;

SELECT * FROM 'Order';

SELECT ShipCountry,
	   Count(ShipCountry) AS Num_Of_Rows,
	   AVG(Freight) AS Avg_Freight,
	   MIN(Freight) AS Min_Freight,
	   MAX(Freight) AS Max_Freight
FROM 'Order'
GROUP BY ShipCountry
HAVING MAX(Freight)>300.0
ORDER BY Num_Of_Rows DESC;

SELECT ShipCountry,
	   Count(ShipCountry) AS Num_Of_Rows,
	   AVG(Freight) AS Avg_Freight,
	   MIN(Freight) AS Min_Freight,
	   MAX(Freight) AS Max_Freight
FROM 'Order'
WHERE ShipCountry GLOB '[A-D]*'
GROUP BY ShipCountry
HAVING MAX(Freight)>300.0
ORDER BY Num_Of_Rows DESC;


