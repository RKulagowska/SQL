DROP TABLE IF EXISTS user;

CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		last_name TEXT,
		email TEXT
);

SELECT * FROM user;

INSERT INTO user (first_name,last_name,email)
VALUES ('Pawel','Nowak','pawel.nowak@wp.pl');

INSERT INTO user (first_name,last_name,email)
VALUES ('Jan','Kowalski','jan.kowalski@wp.pl');

--new 
DROP TABLE IF EXISTS user;

CREATE TABLE user(	
		id INTEGER,
		first_name TEXT,
		last_name TEXT,
		email TEXT,
		primary KEY(id)
);

SELECT * FROM user;

INSERT INTO user (first_name,last_name,email)
VALUES ('Pawel','Nowak','pawel.nowak@wp.pl');

INSERT INTO user (first_name,last_name,email)
VALUES ('Jan','Kowalski','jan.kowalski@wp.pl');

-- próba wprowadzenia tego samego numery na primary key wywoła błąd 
-- Wynik: UNIQUE constraint failed: user.id

INSERT INTO user (id,first_name,last_name,email)
VALUES (2,'Jan','Kowalski','jan.kowalski@wp.pl');

-- próba wprowadzenia NULL na primary key nie wywoła błędu , a nada kolejny mumer i doda wietsz 
INSERT INTO user (id,first_name,last_name,email)
VALUES (NULL,'Jan','Kowalski','jan.kowalski@wp.pl');

--new 

DROP TABLE IF EXISTS user;

CREATE TABLE user(	
		first_name TEXT,
		last_name TEXT,
		email TEXT,
		primary KEY(email)
);

SELECT * FROM user;

INSERT INTO user (first_name,last_name,email)
VALUES ('Pawel','Nowak','pawel.nowak@wp.pl');

INSERT INTO user (first_name,last_name,email)
VALUES ('Jan','Kowalski','jan.kowalski@wp.pl');

-- próba wprowadzenia tego samego numery na primary key wywoła błąd 
-- Wynik: UNIQUE constraint failed: user.email 

INSERT INTO user (first_name,last_name,email)
VALUES ('Jan','Kow','jan.kowalski@wp.pl');

-- próba wprowadzenia NULL na primary key nie wywoła błędu , w tym wypadku pokaże NULL - błąd SQlite 
INSERT INTO user (first_name,last_name,email)
VALUES ('Jan','Kow',NULL);

--new 3

DROP TABLE IF EXISTS user;

CREATE TABLE user(	
		first_name TEXT,
		last_name TEXT,
		email TEXT NOT NULL ,
		primary KEY(email)
);

SELECT * FROM user;

INSERT INTO user (first_name,last_name,email)
VALUES ('Pawel','Nowak','pawel.nowak@wp.pl');

INSERT INTO user (first_name,last_name,email)
VALUES ('Jan','Kowalski','jan.kowalski@wp.pl');

-- próba wprowadzenia tego samego numery na primary key wywoła błąd 
-- Wynik: UNIQUE constraint failed: user.email 

INSERT INTO user (first_name,last_name,email)
VALUES ('Jan','Kow','jan.kowalski@wp.pl');

-- próba wprowadzenia NULL na primary key  i NOT NULL wywoła błąd 
-- Wynik: NOT NULL constraint failed: user.email

INSERT INTO user (first_name,last_name,email)
VALUES ('Jan','Kow',NULL);

-- new 4 

CREATE TABLE stock(	
		company TEXT NOT NULL,
		stock_exchange TEXT NOT NULL,
		price REAL,
		PRIMARY KEY (company, stock_exchange)
);

DROP TABLE stock;
DROP TABLE user;

