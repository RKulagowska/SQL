-- połacz 2 tabele i wyciągnij średnią z Number w City_name 

DROP TABLE IF EXISTS CITY;
DROP TABLE IF EXISTS REVENUE;

CREATE TABLE CITY (
		Code      INTEGER NOT NULL,
		City_name      TEXT NOT NULL
);
CREATE TABLE REVENUE (
		Code     INTEGER NOT NULL,
		Number       Integer NOT NULL
);

INSERT INTO CITIES (Code, City_name )
VALUES (1,'Warszawa'),
		(2, 'Toruń'),
		(3,'Paris');

INSERT INTO REVENUE(Code,Number)
VALUES (1,100),
		(2,50),	
		(2,100),
		(3,150);	
		
SELECT * from CITIES;
SELECT * from REVENUE;

SELECT t2.City_name,
	   AVG(Revenue)
FROM REVENUE AS t1
LEFT JOIN CITIES  AS t2 ON t1.City_code = t2.City_code
GROUP BY City_name;
