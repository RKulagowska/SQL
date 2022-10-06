DROP TABLE IF EXISTS sales1;
DROP TABLE IF EXISTS sales2;

CREATE TABLE sales1 (
		prod_name  TEXT      NOT NULL,
		price      REAL      NOT NULL,
		quantity   INTEGER      NOT NULL
);
CREATE TABLE sales2 (
		prod_name  TEXT      NOT NULL,
		price      REAL      NOT NULL,
		quantity   INTEGER      NOT NULL
);

INSERT INTO sales1 (prod_name,price,quantity)
VALUES ('A',20.00,1),
		('B',25.00,4),
		('C',17.00,3),
		('D',18.00,1);
INSERT INTO sales2 (prod_name,price,quantity)
VALUES ('A',20.00,1),
		('B',25.00,4),
		('x',14.00,3),
		('y',22.00,3);
		
SELECT * FROM sales1;
SELECT * FROM sales2;

SELECT * FROM sales1
UNION ALL
SELECT * FROM sales2;

SELECT * FROM sales1
UNION ALL
SELECT * FROM sales2
ORDER BY price;

-- zapytanie poniżej ograniczy wiersze price > 40 tylko do 2 tabeli 

SELECT * FROM sales1
UNION ALL
SELECT * FROM sales2
WHERE price > 20 
ORDER BY price;
