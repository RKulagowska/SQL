DROP TABLE IF EXISTS stock;

CREATE TABLE stock(	
		id 			INTEGER PRIMARY KEY,
		ticker 		TEXT NOT NULL,
		full_name 	TEXT NOT NULL,
		market 		TEXT NOT NULL DEFAULT 'GWP'
);

INSERT INTO stock(ticker,full_name)
VALUES ('CDR', 'CD Project'),
		('PLW','Playway'),
		('BBT','Boombit'),
		('ULG','Ulitimate Games');
		
SELECT * FROM stock;

CREATE TABLE company(
		id  			INTEGER PRIMARY KEY,
		company_name 	TEXT NOT NULL
);

INSERT INTO company(company_name) SELECT full_name FROM stock;
SELECT * FROM company;


SELECT * FROM Customer;

CREATE TABLE customer_uk(
		id 			  INTEGER 	PRIMARY KEY,
		company_name  TEXT 		NOT NULL,
		contact_name  TEXT 		NOT NULL,
		contact_title TEXT 		NOT NULL
);

INSERT INTO customer_uk (company_name,contact_name,contact_title)
SELECT CompanyName,ContactName,ContactTitle
FROM Customer
WHERE Country == 'UK';

SELECT * from customer_uk;


		
