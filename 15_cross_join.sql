DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS calendar;

CREATE TABLE category (
		id            INTEGER PRIMARY KEY,
		category_name TEXT NOT NULL
);
CREATE TABLE calendar (
		id            INTEGER PRIMARY KEY,
		Quarter       TEXT NOT NULL
);

INSERT INTO category (category_name)
VALUES ('in-store'),
		('online');

INSERT INTO calendar(quarter)
VALUES ('Q1'),
		('Q2'),	
		('Q3'),
		('Q4');	
		
SELECT * from Calendar;
SELECT * from Category;

SELECT category_name, 
		Quarter 
from Calendar 
join category
ORDER BY 2;


SELECT category_name, 
		Quarter 
from Calendar, category
ORDER BY 2;

SELECT category_name, 
		Quarter 
from Calendar, category
WHERE Quarter == 'Q2'
ORDER BY 2;

CREATE TABLE report AS 
SELECT category_name, Quarter from Calendar, category;

SELECT * FROM report;

DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS calendar;
DROP TABLE IF EXISTS report;

