/*
zadania SQL 
*/

DROP TABLE IF EXISTS 'esmartdata_instructor';

CREATE TABLE esmartdata_instructor(
    id    INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	first_name TEXT NOT NULL,
    last_name  TEXT NOT NULL,
    description TEXT NOT NULL
    );
	
DROP TABLE IF EXISTS 'esmartdata_course';

CREATE TABLE esmartdata_course(
    id    INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT NOT NULL,
    subtitle  TEXT NOT NULL,
    description TEXT NOT NULL,
	category TEXT NOT NULL,
    subcategory  TEXT NOT NULL,
    language TEXT NOT NULL,
	lenght TEXT NOT NULL,
	rating REAL NOT NULL,
    referral_link  TEXT NOT NULL,
    instructor_id INTEGER NOT NULL,
	FOREIGN KEY ('instructor_id')REFERENCES 'esmartdata_instructor'('id')
    );
	
INSERT INTO 'esmartdata_instructor' VALUES
					(1,"Paweł", "Krakowiak", "Data Scientist/Python Developer/Securities Broker"),	
					(2, "takeITeasy", "Academy", "Akademia Programowania");

SELECT * FROM esmartdata_instructor; 	
    
	