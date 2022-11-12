CREATE TABLE stock(	
		id INTEGER PRIMARY KEY,
		ticker TEXT,
		full_name TEXT
);

INSERT INTO stock(ticker,full_name)
VALUES ('CDR', 'CD PROJECT');

INSERT INTO stock(ticker,full_name)
VALUES('PLW','PLAYWAY');

INSERT INTO stock(ticker,full_name)
VALUES ('TE','TEN SQUARE GAMES');

SELECT * FROM stock;

SELECT * FROM stock;

-- ver 2
DROP TABLE stock;

CREATE TABLE stock(	
		id INTEGER PRIMARY KEY,
		ticker TEXT check(LENGTH(ticker)==3),
		full_name TEXT
);

INSERT INTO stock(ticker,full_name)
VALUES ('CDR', 'CD PROJECT');

INSERT INTO stock(ticker,full_name)
VALUES('PLW','PLAYWAY');

-- nie spełnia check'u zwróci bład Wynik: CHECK constraint failed: LENGTH(ticker)==3
INSERT INTO stock(ticker,full_name)
VALUES ('TE','TEN SQUARE GAMES');

SELECT * FROM stock;


-- ver 3

DROP TABLE stock;

CREATE TABLE stock(	
		id INTEGER PRIMARY KEY,
		ticker TEXT check(LENGTH(ticker)==3),
		full_name TEXT check (full_name!= ''), 
		price REAL CHECK(price >0) 
);

INSERT INTO stock(ticker,full_name,price)
VALUES ('CDR', 'CD PROJECT',100);

INSERT INTO stock(ticker,full_name,price)
VALUES('PLW','PLAYWAY',200);

-- nie spełnia check'u zwróci bład Wynik: Wynik: CHECK constraint failed: price >0
INSERT INTO stock(ticker,full_name,price)
VALUES ('TEN','nowy',-300);

SELECT * FROM stock;


