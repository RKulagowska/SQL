DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS developer;

CREATE TABLE user(	
		id 				INTEGER PRIMARY KEY,
		first_name 		TEXT NOT NULL,
		last_name 		TEXT NOT NULL,
		gender 			TEXT,
		birth_date 		TEXT
);

CREATE TABLE developer(	
		user_id 	INTEGER PRIMARY KEY REFERENCES user(id),
		job_title 	TEXT NOT NULL,
		department 	TEXT NOT NULL
);

INSERT INTO user(first_name,last_name,gender,birth_date)
VALUES ('John','Smith','M','1996-05-05'),
		('Jan','Kowalski','M','2000-06-05'),
		('Monika','Bys','K','2002-07-07');

INSERT INTO developer(user_id,job_title,department)
VALUES (1,'Admin','AD'),
		(2,'SQL Developer','IT'),
		(3, 'Java Developer', 'IT');
		
SELECT * FROM user;
SELECT * FROM developer;	

-- ograniczenie klucza głownego nie pozwoli wrowadzić duplikatów 
-- Wynik: UNIQUE constraint failed: user.id

INSERT INTO user(id, first_name,last_name,gender,birth_date)
VALUES (1, 'John','Smith','M','1996-05-05');	

-- nie pozwoli skasować z tabeli nadrzędnej jesli wykorzystano w podrzędnej 
-- Wynik: FOREIGN KEY constraint failed

DELETE FROM user WHERE id == 2;

-- najpierw skasujemy z podrżednej potem nadrzednej 
-- Wynik: FOREIGN KEY constraint failed
DELETE FROM developer WHERE user_id == 2;
DELETE FROM user WHERE id == 2;

SELECT * FROM user;
SELECT * FROM developer;

