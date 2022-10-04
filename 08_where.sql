SELECT * FROM Customer;

-- tylko Polska 
SELECT * FROM Customer WHERE country == 'Poland';

SELECT * FROM Customer WHERE country == 'USA' ORDER BY City;

-- sprawdź unikalne wart dla Region 

SELECT DISTINCT Region FROM Customer where country == 'USA';

SELECT * FROM  customer WHERE region == 'North America';

SELECT ProductName, UnitPrice FROM  Product WHERE UnitPrice >= 40 ORDER BY UnitPrice;

SELECT ProductName, UnitPrice, UnitsInStock FROM Product;

--  nie trzeba wybierać kolumny żeby po nie filtrować 
SELECT ProductName, UnitPrice FROM Product where UnitsInStock == 0 ;
SELECT ProductName, UnitPrice FROM Product where UnitsInStock != 0 ;

-- operatory logiczne 
--AND 
SELECT * FROM Customer WHERE country == 'UK' And city == 'London';
-- OR 
SELECT * FROM Customer WHERE country == 'UK' OR country == 'Italy';
SELECT * FROM Customer WHERE country == 'UK' OR country == 'Italy' OR country == 'Poland';
-- przeciwne - nie w krajach wskazanych 
SELECT * FROM Customer WHERE country != 'UK' AND country != 'Italy' AND country != 'Poland';
-- IN 
SELECT * FROM Customer WHERE country IN ('UK', 'Italy','Poland');
-- NOT IN
SELECT * FROM Customer WHERE country NOT IN ('UK', 'Italy','Poland');
-- BETWEEN 
SELECT ProductName, UnitPrice FROM Product WHERE UnitPrice >= 15 AND UnitPrice <= 20;
SELECT ProductName, UnitPrice FROM Product WHERE UnitPrice BETWEEN 15 AND 20;
-- NOT BETWEEN
SELECT ProductName, UnitPrice FROM Product WHERE UnitPrice NOT BETWEEN 15 AND 20;
-- IS NULL 
SELECT * FROM Customer WHERE fax IS NULL;
-- IS NOT NULL
SELECT * FROM Customer WHERE fax IS NOT NULL;

-- LIKE 
SELECT CompanyName, ContactName, Country FROM Customer;
SELECT CompanyName, ContactName, Country FROM Customer WHERE CompanyName == 'Bon app';
SELECT CompanyName, ContactName, Country FROM Customer WHERE CompanyName == 'bon app';
SELECT CompanyName, ContactName, Country FROM Customer WHERE CompanyName LIKE 'b%';
SELECT CompanyName, ContactName, Country FROM Customer WHERE CompanyName LIKE '%en';
-- NOT LIKE 
SELECT CompanyName, 
		ContactName, 
		Country 
FROM Customer 
WHERE CompanyName LIKE '%en' OR CompanyName LIKE '%es';

SELECT CompanyName, 
		ContactName, 
		Country 
FROM Customer 
WHERE CompanyName LIKE '%co%' ;

SELECT CompanyName, 
		ContactName, 
		Country 
FROM Customer 
WHERE Country LIKE '___' ;

SELECT CompanyName, 
		ContactName, 
		Country 
FROM Customer 
WHERE ContactName LIKE 'J__n %' ;

-- GLOB 
SELECT CompanyName, 
		ContactName, 
		Country 
FROM Customer 
WHERE ContactName GLOB 'An*';

SELECT CompanyName, 
		ContactName, 
		Country 
FROM Customer 
WHERE ContactName GLOB 'An? *';

-- między a i d 
SELECT CompanyName, 
		ContactName, 
		Country 
FROM Customer 
WHERE CompanyName GLOB '[A-D]*';

-- oprócz tych między a i d 
SELECT CompanyName, 
		ContactName, 
		Country 
FROM Customer 
WHERE CompanyName GLOB '[^A-D]*';

