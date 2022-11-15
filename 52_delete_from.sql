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

DELETE FROM stock WHERE id==4;

-- bez where 
DELETE FROM stock;

DELETE FROM stock WHERE full_name LIKE 'C%';
