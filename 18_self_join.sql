CREATE TABLE sales (
		id            INTEGER PRIMARY KEY,
		quarter       TEXT      NOT NULL,
		revenue       REAL      NOT NULL CHECK (revenue>0)
);

INSERT INTO sales (quarter,revenue)
VALUES ('Q1', 15000),
		('Q2',16000),
		('Q3',17000),
		('Q4',18000);

SELECT * FROM Sales;

SELECT * FROM Sales AS t1 JOIN sales AS t2;

SELECT * FROM Sales AS t1 JOIN sales AS t2 ON t1.id = t2.id-1;

SELECT t1.quarter, 
	   t2.quarter
FROM Sales AS t1 
JOIN sales As t2 ON t1.id = t2.id-1;

SELECT t1.quarter || ' - ' || t2.quarter AS period,
		t1.revenue || ' - ' || t2.revenue AS Q,
		(t2.revenue - t1.revenue) AS Quarter_Change, 
		(t2.revenue - t1.revenue)/t1.revenue AS pct_change
FROM Sales AS t1 
JOIN sales As t2 ON t1.id = t2.id-1;
