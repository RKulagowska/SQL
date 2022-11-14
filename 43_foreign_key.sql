-- Sprawdza czy dziąła ograniczenie klucza obcego 

PRAGMA foreign_keys; 

CREATE TABLE user_group(	
		id INTEGER PRIMARY KEY,
		group_name TEXT NOT NULL
);

CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		Last_name TEXT,
		email TEXT UNIQUE,
		user_group_id INTEGER NOT NULL
);

INSERT INTO user_group(group_name)
VALUES ('admin'),
		('user'),
		('developer'),
		('tester');
		
SELECT * FROM user_group;	

INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Smith','john.smith@wp.pl',1),
		('Jan','Kowalski','jan.kowalski@wp.pl',2);

SELECT * FROM user;	

-- bez ograniczenia pozwoli na wprowadzenie dowolnych wartości w user_group_id
INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Black','john.black@wp.pl',10);

SELECT * FROM user;	


-- ver 2 ograniczenie FOREIGN KEY na poziomie kolumny  
	
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
		user_group_id INTEGER NOT NULL REFERENCES user_group(id)
);

INSERT INTO user_group(group_name)
VALUES ('admin'),
		('user'),
		('developer'),
		('tester');
		
SELECT * FROM user_group;	

INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Smith','john.smith@wp.pl',1),
		('Jan','Kowalski','jan.kowalski@wp.pl',2);

SELECT * FROM user;	

-- FOREIGN KEY constraint failed - bo nie ma w tabeli user
INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Black','john.black@wp.pl',10);

-- ver 3 ograniczenie FOREIGN KEYna całej tabeli 

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
		
SELECT * FROM user_group;	

INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Smith','john.smith@wp.pl',1),
		('Jan','Kowalski','jan.kowalski@wp.pl',2);

SELECT * FROM user;	

-- FOREIGN KEY constraint failed - bo nie ma w tabeli user
INSERT INTO user(first_name,Last_name,email,user_group_id)
VALUES ('John','Black','john.black@wp.pl',10);

-- próba usuniecia user_group (tabeli podrzędnej) zwróci błąd Wynik: FOREIGN KEY constraint failed
-- trzeba najpierw usunąc tabele nadrzędną a potem podrzędną 
DROP TABLE user_group;

DROP TABLE user;
DROP TABLE user_group;
