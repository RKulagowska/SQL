CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		last_name TEXT,
		email TEXT,
		country TEXT
);

INSERT INTO user (first_name, last_name, email ,country)
VALUES ('Pawel','Nowak','pawel.nowak@wp.pl','Poland');

INSERT INTO user(first_name,last_name,email,country)
VALUES ('Jan','Kowalski','jan.kowalski@wp.pl','USA');

SELECT * FROM user;

INSERT INTO user(first_name,last_name,email)
VALUES ('Jan','Kowalski','jan.kowalski@wp.pl');

SELECT * FROM user;


--V2 
DROP TABLE user;

CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		last_name TEXT,
		email TEXT,
		country TEXT DEFAULT 'Poland'
);
INSERT INTO user(first_name,last_name,email)
VALUES ('Jan','Kowalski','jan.kowalski@wp.pl');

SELECT * FROM user;

-- v3

DROP TABLE user;

CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		last_name TEXT,
		email TEXT,
		country TEXT DEFAULT 'Poland',
		created TEXT DEFAULT CURRENT_TIME
);
INSERT INTO user(first_name,last_name,email)
VALUES ('Jan','Kowalski','jan.kowalski@wp.pl');

SELECT * FROM user;
