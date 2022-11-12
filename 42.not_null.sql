DROP TABLE stock;

CREATE TABLE stock(	
		id INTEGER PRIMARY KEY,
		ticker TEXT,
		full_name TEXT
);

INSERT INTO stock(ticker,full_name)
VALUES ('CDR', 'CD PROJECT');

INSERT INTO stock(ticker,full_name)
VALUES('PLW','PLAYWAY');

SELECT * FROM stock;

INSERT INTO stock(ticker)
VALUES('PLW');

SELECT * FROM stock;

-- ver 2 

DROP TABLE stock;

CREATE TABLE stock(	
		id INTEGER PRIMARY KEY,
		ticker TEXT NOT NULL,
		full_name TEXT NOT NULL
);

INSERT INTO stock(ticker,full_name)
VALUES ('CDR', 'CD PROJECT');

INSERT INTO stock(ticker,full_name)
VALUES('PLW','PLAYWAY');

SELECT * FROM stock;

-- Zwróci bład jesli próbujemy wprowadzić NULL Wynik: NOT NULL constraint failed: stock.full_name
INSERT INTO stock(ticker)
VALUES('PLW');

DROP TABLE stock;

SELECT * FROM stock;