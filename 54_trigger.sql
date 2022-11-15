DROP TABLE IF EXISTS stock;

CREATE TABLE stock(	
		id 			INTEGER PRIMARY KEY,
		ticker 		TEXT 	NOT NULL,
		company 	TEXT 	NOT NULL,
		price		REAL 	NOT NULL,
		email		TEXT 	NOT NULL 
);

INSERT INTO stock(ticker,company,price,email)
VALUES ('CDR', 'CD Project',650,'ac@wp.pl'),
		('PLW','Playway',700,'dominikc@onet');
		
SELECT * FROM stock;
DELETE FROM stock;

CREATE TRIGGER validate_email BEFORE INSERT
ON stock
BEGIN
	SELECT CASE 
		WHEN NEW.email  NOT LIKE '%_@__%.__%' THEN RAISE(ABORT, 'Invalid email')
	END;
END;

INSERT INTO stock(ticker,company,price,email)
VALUES ('CDR', 'CD Project',650,'ac@wp.pl');

SELECT * FROM stock;

-- SPRAWDZAMY JAK ZADZIAŁĄ TRIGGER Wynik: Invalid email
	
INSERT INTO stock(ticker,company,price,email)
VALUES ('PLW','Playway',700,'dominikc@onet');

DROP TRIGGER validate_email;
DROP TABLE IF EXISTS stock;
