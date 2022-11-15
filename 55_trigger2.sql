DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS stock_logs;

CREATE TABLE stock(	
		id 			INTEGER PRIMARY KEY,
		ticker 		TEXT 	NOT NULL,
		company 	TEXT 	NOT NULL,
		price		REAL 	NOT NULL,
		email		TEXT 	NOT NULL 
);

INSERT INTO stock(ticker,company,price,email)
VALUES ('CDR', 'CD Project',650,'ac@wp.pl'),
		('PLW','Playway',700,'dominikc@onet.pl');
		
SELECT * FROM stock;

CREATE TABLE stock_logs(	
		id 			INTEGER PRIMARY KEY,
		old_id 		INT,
		new_id 	    INT,
		old_contact	TEXT,
		new_contact	TEXT, 
		action_type	TEXT,
		create_at	TEXT 
);

CREATE TRIGGER logs_update_email AFTER UPDATE
ON stock WHEN OLD.email != NEW.email
BEGIN
	INSERT INTO stock_logs(
	old_id,
	new_id,
	old_contact,
	new_contact,
	action_type,
	create_at
	)
	VALUES(
		OLD.id,
		NEW.id,
		OLD.email,
		NEW.email,
		'UPDATE',
		DATETIME('now')
	);
END;

SELECT * FROM stock;
SELECT * FROM stock_logs;

UPDATE stock SET email = 'new@wp.pl' WHERE id==1;

DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS stock_logs;
