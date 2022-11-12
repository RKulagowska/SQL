DROP TABLE user;

CREATE TABLE user(	
		id INTEGER PRIMARY KEY,
		first_name TEXT,
		last_name TEXT,
		email TEXT,
		country TEXT DEFAULT 'Poland'
);

-- maksymalna wartość dla rowid 9223372036854775807

INSERT INTO user (id, first_name, last_name, email)
VALUES (9223372036854775807,'Pawel','Nowak','pawel.nowak@wp.pl');

-- większa niż max wartość dla rowid pojawi się błąd Wynik: datatype mismatch
INSERT INTO user(id, first_name,last_name,email,country)
VALUES (9223372036854775808, 'Jan','Kowalski','jan.kowalski@wp.pl','USA');

SELECT * FROM user;

INSERT INTO user(first_name,last_name,email,country)
VALUES ('Jan','Kowalski','jan.kowalski@wp.pl','USA');

SELECT * FROM user;

-- ver 2 

DROP TABLE user;

CREATE TABLE user(	
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		first_name TEXT,
		last_name TEXT,
		email TEXT,
		country TEXT DEFAULT 'Poland'
);

-- maksymalna wartość dla rowid 9223372036854775807

INSERT INTO user (id, first_name, last_name, email)
VALUES (9223372036854775807,'Pawel','Nowak','pawel.nowak@wp.pl');

-- większa niż max wartość dla rowid pojawi się błąd Wynik: datatype mismatch
INSERT INTO user(id, first_name,last_name,email,country)
VALUES (9223372036854775808, 'Jan','Kowalski','jan.kowalski@wp.pl','USA');


SELECT * FROM user;