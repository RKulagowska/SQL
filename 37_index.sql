DROP TABLE IF EXISTS stock_market;

CREATE TABLE stock_market(	
		ticker TEXT NOT NULL,
		company TEXT NOT NULL,
		price REAL NOT NULL
);
INSERT INTO stock_market (ticker,company, price)
VALUES ('CDR', 'CD PROJECT', 260),
		('PLW','PLAYWAY',650),
		('TEN','TEN SQUARE GAMES',550),
		('PCF','PCF GROUP',80),
		('11B','11 BIT STUDIOS',550),
		('BBT','BOOMBIT',18),
		('CFG','CREATIVE FORGE',37);
		
EXPLAIN QUERY PLAN 
SELECT * 
FROM stock_market
WHERE ROWID ==5;

EXPLAIN QUERY PLAN 
SELECT * 
FROM stock_market
WHERE ticker =='BBT';

CREATE INDEX idx_ticker ON stock_market(ticker); 

EXPLAIN QUERY PLAN 
SELECT * 
FROM stock_market
WHERE ticker =='BBT';

DROP INDEX idx_ticker;

EXPLAIN QUERY PLAN 
SELECT * 
FROM stock_market
WHERE ticker =='BBT';
