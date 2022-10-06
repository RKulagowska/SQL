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
UNION
SELECT * FROM sales2;

/*
Liczba kolumn musi być taka sama w obu zapytaniach. Zapytanie poniżej zwróci błąd:
'SELECTs to the left and right of UNION do not have the same number of result columns'
*/

SELECT price FROM sales1
UNION
SELECT * FROM sales2;

SELECT prod_name FROM sales1
UNION
SELECT prod_name  FROM sales2;