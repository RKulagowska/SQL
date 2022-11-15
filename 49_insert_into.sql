DROP TABLE IF EXISTS stock;

CREATE TABLE stock(	
		id 			INTEGER PRIMARY KEY,
		ticker 		TEXT NOT NULL,
		full_name 	TEXT NOT NULL,
		market 		TEXT NOT NULL DEFAULT 'GWP'
);

INSERT INTO stock(id,ticker,full_name,market)
VALUES (1,'CDR', 'CD Project', 'GWP');
 
-- zadziała poniższe ale będziemy mieli problem jak będziemy chieli dodać nową kolumne do tabli  
-- nie rekomendowane 
INSERT INTO stock
VALUES (2,'PLW', 'Playway', 'GWP'); 


-- id nie musimy wprowadzać bo INTEGER primary key - sam nada kolejną. 
-- Nie musimy teź wprowadzać jeśli jest określona wartość domyślna  

INSERT INTO stock(ticker,full_name)
VALUES ('TEN', 'Ten Square Games');

SELECT * FROM stock;

-- ver 2 wiele wierszy naraz 

DROP TABLE IF EXISTS stock;

CREATE TABLE stock(	
		id 			INTEGER PRIMARY KEY,
		ticker 		TEXT NOT NULL,
		full_name 	TEXT NOT NULL,
		market 		TEXT NOT NULL DEFAULT 'GWP'
);

INSERT INTO stock(id,ticker,full_name,market)
VALUES (1,'CDR', 'CD Project', 'GWP'),
		(2,'PLW', 'Playway', 'GWP'); 
		
SELECT * FROM stock;