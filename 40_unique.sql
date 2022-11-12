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
VALUES ('TEN','TEN SQUARE GAMES');

SELECT * FROM stock;

-- pozwala wpisywać ten sam wiersz bo nie ma ograniczeń 

INSERT INTO stock(ticker,full_name)
VALUES ('TEN','TEN SQUARE GAMES');

SELECT * FROM stock;

-- ver 2
DROP TABLE stock;

CREATE TABLE stock(	
		id INTEGER PRIMARY KEY,
		ticker TEXT UNIQUE,
		full_name TEXT
);

INSERT INTO stock(ticker,full_name)
VALUES ('CDR', 'CD PROJECT');

INSERT INTO stock(ticker,full_name)
VALUES('PLW','PLAYWAY');

INSERT INTO stock(ticker,full_name)
VALUES ('TEN','TEN SQUARE GAMES');

SELECT * FROM stock;

-- powtórne wpianie tego samego wiersza zwróci błąd Wynik: UNIQUE constraint failed: stock.ticker
INSERT INTO stock(ticker,full_name)
VALUES ('TEN','TEN SQUARE GAMES');

SELECT * FROM stock;

SELECT * FROM stock WHERE ticker == 'CDR';

EXPLAIN QUERY PLAN SELECT * FROM stock WHERE ticker == 'CDR';
		
DROP TABLE stock;	