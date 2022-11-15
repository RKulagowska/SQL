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

UPDATE stock SET market= 'New Connect' WHERE id==4;

SELECT * FROM stock;

UPDATE stock 
SET ticker= 'CDR.PL',full_name = 'CD Project Red' 
WHERE id==1;

SELECT * FROM stock;

UPDATE stock 
SET market = 'GWP w Warszawie'
WHERE market = 'GWP';

SELECT * FROM stock;


-- bez where 
UPDATE stock 
SET ticker = 'CDR';

SELECT * FROM stock;
