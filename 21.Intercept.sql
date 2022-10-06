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
VALUES ('A',20.00,2),
		('B',25.00,4),
		('x',14.00,3),
		('y',22.00,3);
		
SELECT * FROM sales1;
SELECT * FROM sales2;

-- Prod_name A zostanie wyswietlony bo wszystkie kolumny musza być identyczne 
SELECT * FROM sales1
EXCEPT
SELECT * FROM sales2;

-- Prod_name A skasowany bo bierzemy pod uwagę tylko dane z kol prod_name 
SELECT prod_name FROM sales1
EXCEPT
SELECT prod_name FROM sales2;

SELECT prod_name FROM sales2
EXCEPT
SELECT prod_name FROM sales1;
