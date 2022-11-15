CREATE TABLE stock(	
		id 			INTEGER PRIMARY KEY,
		ticker 		TEXT NOT NULL,
		full_name 	TEXT NOT NULL
);

INSERT INTO stock(ticker,full_name)
VALUES ('CDR', 'CD Project'),
		('PLW', 'Playway');

SELECT * FROM stock; 

ALTER TABLE stock ADD COLUMN price REAL;

SELECT * FROM stock;

INSERT INTO stock(ticker,full_name,price)
VALUES ('TEN', 'Ten Square Games',500);

SELECT * FROM stock;		

--ver 2
DROP TABLE stock;

CREATE TABLE stock(	
		id 			INTEGER PRIMARY KEY,
		ticker 		TEXT NOT NULL,
		full_name 	TEXT NOT NULL
);

INSERT INTO stock(ticker,full_name)
VALUES ('CDR', 'CD Project'),
		('PLW', 'Playway');

SELECT * FROM stock; 

ALTER TABLE stock ADD COLUMN price REAL CHECK(price>0);

SELECT * FROM stock;

--  poniższe wywoła błąd Wynik: CHECK constraint failed: price>0
INSERT INTO stock(ticker,full_name,price)
VALUES ('TEN', 'Ten Square Games',0);


-- ver 3 
DROP TABLE stock;

CREATE TABLE stock(	
		id 			INTEGER PRIMARY KEY,
		ticker 		TEXT NOT NULL,
		full_name 	TEXT NOT NULL
);

INSERT INTO stock(ticker,full_name)
VALUES ('CDR', 'CD Project'),
		('PLW', 'Playway');

SELECT * FROM stock; 


-- Wynik: Cannot add a NOT NULL column with default value NULL 
-- bo już do tabeli wprowadziliśmy null 

ALTER TABLE stock ADD COLUMN price REAL NOT NULL CHECK(price>0);

--Zapis poniżej zmieni null już istniejące w tabeli i zastąpi 0 
ALTER TABLE stock ADD COLUMN price REAL NOT NULL DEFAULT 0 CHECK(price>0);

SELECT * FROM stock;

INSERT INTO stock(ticker,full_name,price)
VALUES ('TEN', 'Ten Square Games',10);

ALTER TABLE stock RENAME COLUMN full_name To company_name;
SELECT * FROM stock;

ALTER TABLE stock RENAME TO stock_market;

SELECT * FROM stock_market;
