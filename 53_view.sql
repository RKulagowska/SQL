SELECT * FROM OrderDetail;
SELECT * FROM Product;

SELECT *
FROM OrderDetail AS O 
LEFT JOIN Product AS P ON O.ProductId == P.id;

SELECT O.Id,
	   O.OrderId,
	   O.ProductId,
	   P.ProductName,
	   O.UnitPrice,
	   O.Quantity,
	   O.Discount
FROM OrderDetail AS O 
LEFT JOIN Product AS P ON O.ProductId == P.id;

CREATE VIEW OrderSimpleDetails AS
SELECT O.Id,
	   O.OrderId,
	   O.ProductId,
	   P.ProductName,
	   O.UnitPrice,
	   O.Quantity,
	   O.Discount
FROM OrderDetail AS O 
LEFT JOIN Product AS P ON O.ProductId == P.id;

SELECT * FROM OrderSimpleDetails;

SELECT * FROM OrderSimpleDetails WHERE UnitPrice >10;

DROP VIEW OrderSimpleDetails;
