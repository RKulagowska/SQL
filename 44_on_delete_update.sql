
DROP TABLE user;
DROP TABLE user_group;

CREATE TABLE user_group(	
		id INTEGER PRIMARY KEY,
		group_name TEXT NOT NULL
);

CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		Last_name TEXT,
		email TEXT UNIQUE,
		user_group_id INTEGER NOT NULL,
		FOREIGN KEY (user_group_id)
		REFERENCES user_group(id)
);

INSERT INTO user_group(group_name)
VALUES ('admin'),
		('user'),
		('developer'),
		('tester');
		
INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Smith','john.smith@wp.pl',1),
		('Jan','Kowalski','jan.kowalski@wp.pl',2);

SELECT * FROM user;	

-- kasowanie wiersza w tabeli nadrzędnej jesłi w podrzędnej występowały rekory 
-- zwróci błąd Wynik: FOREIGN KEY constraint failed

DELETE FROM user_group WHERE id ==1;

-- kasowanie wiersza w tabeli nadrzędnej jesłi w podrzędnej nie ma rekordów jest możliwe 
DELETE FROM user_group WHERE id ==4;

SELECT * FROM user_group;

DROP TABLE user;
DROP TABLE user_group;

-- ver 2 on delete 

CREATE TABLE user_group(	
		id INTEGER PRIMARY KEY,
		group_name TEXT NOT NULL
);

CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		Last_name TEXT,
		email TEXT UNIQUE,
		user_group_id INTEGER NOT NULL,
		FOREIGN KEY (user_group_id)
		REFERENCES user_group(id) ON DELETE CASCADE
);

INSERT INTO user_group(group_name)
VALUES ('admin'),
		('user'),
		('developer'),
		('tester');
		
INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Smith','john.smith@wp.pl',1),
		('Jan','Kowalski','jan.kowalski@wp.pl',2);

SELECT * FROM user;	

-- kasowanie wiersza w tabeli nadrzędnej spowoduje skasowanie rekordów z podrzednej 

DELETE FROM user_group WHERE id ==1;

SELECT * FROM user_group;
SELECT * FROM user;

-- ver 3 ON DELETE SET NULL

DROP TABLE user;
DROP TABLE user_group;

CREATE TABLE user_group(	
		id INTEGER PRIMARY KEY,
		group_name TEXT NOT NULL
);

CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		Last_name TEXT,
		email TEXT UNIQUE,
		user_group_id INTEGER,
		FOREIGN KEY (user_group_id)
		REFERENCES user_group(id) ON DELETE SET NULL
);

INSERT INTO user_group(group_name)
VALUES ('admin'),
		('user'),
		('developer'),
		('tester');
		
INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Smith','john.smith@wp.pl',1),
		('Jan','Kowalski','jan.kowalski@wp.pl',2);

SELECT * FROM user;	

-- kasowanie wiersza w tabeli nadrzędnej jesłi w podrzędnej występowały rekory 
-- zwróci null w pozycji user_group_id

DELETE FROM user_group WHERE id ==1;

SELECT * FROM user;	

DROP TABLE user;
DROP TABLE user_group;

-- ver 4 ON UPDATE 

CREATE TABLE user_group(	
		id INTEGER PRIMARY KEY,
		group_name TEXT NOT NULL
);

CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		Last_name TEXT,
		email TEXT UNIQUE,
		user_group_id INTEGER,
		FOREIGN KEY (user_group_id)
		REFERENCES user_group(id) ON UPDATE CASCADE
);

INSERT INTO user_group(group_name)
VALUES ('admin'),
		('user'),
		('developer'),
		('tester');
		
INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Smith','john.smith@wp.pl',1),
		('Jan','Kowalski','jan.kowalski@wp.pl',2);

SELECT * FROM user;	

-- update wiersza w tabeli nadrzędnej jesli w podrzędnej występowały rekory 
-- zwróci update w pozycji user_group_id

UPDATE user_group SET id ==5 WHERE id ==1;

SELECT * FROM user_group;	
SELECT * FROM user;

DROP TABLE user;
DROP TABLE user_group;