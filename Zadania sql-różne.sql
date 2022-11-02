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

-- Tylko parzyste numery ID

SELECT * 
FROM 'ORDER'
WHERE id%2=0; 

-- Róznica między wszystkimi zamówieniami a liczbą unikalnych dni zamówień 

SELECT COUNT(OrderDate) - COUNT(DISTINCT OrderDate) AS Difference
FROM 'Order';

-- Znajdź najkrótsze (najmniej znaków) ShipCountry i najdłuższe z odpowiadającymi im ilościami znaków 

SELECT ShipCountry, LENGTH(ShipCountry)
FROM 'Order'
ORDER BY LENGTH(ShipCountry), ShipCountry
LIMIT 1; 
SELECT ShipCountry, LENGTH(ShipCountry)
FROM 'Order'
ORDER BY LENGTH(ShipCountry) DESC, ShipCountry DESC
LIMIT 1;

-- wszystkie unikalne ShipCountry zaczynające się na (A,E,I,O LUB U)
SELECT DISTINCT(ShipCountry)
FROM 'ORDER'
WHERE ShipCountry LIKE 'A%' OR ShipCountry LIKE 'E%' OR ShipCountry LIKE 'I%' OR ShipCountry LIKE 'O%' OR ShipCountry LIKE 'U%';

SELECT DISTINCT(ShipCountry)
FROM 'ORDER'
WHERE ShipCountry REGEXP'^[A,E,I,O,U]';

--wszystkie zakończone na (A,E,I,O LUB U)
SELECT DISTINCT(ShipCountry)
FROM 'ORDER'
WHERE ShipCountry LIKE '%a' OR ShipCountry LIKE '%e' OR ShipCountry LIKE '%i' OR ShipCountry LIKE '%o' OR ShipCountry LIKE '%u';

SELECT DISTINCT ShipCountry 
FROM 'ORDER'
WHERE SUBSTR(ShipCountry,LENGTH(ShipCountry),1) IN ('a','e','i','o','u');

--wszystkie zakończone na (A,E,I,O LUB U) lub zaczynające się od tych liter 

SELECT DISTINCT ShipCountry
FROM 'ORDER' 
WHERE ShipCountry REGEXP'^[A,E,I,O,U].*[a,e,i,o,u]$';

-- NIE KOŃCZY SIĘ NA  (A,E,I,O LUB U)
SELECT DISTINCT(ShipCountry)
FROM 'ORDER'
WHERE ShipCountry NOT LIKE '%a' AND ShipCountry NOT LIKE '%e' AND ShipCountry NOT LIKE '%i' AND ShipCountry NOT LIKE '%o' AND ShipCountry NOT LIKE '%u';


