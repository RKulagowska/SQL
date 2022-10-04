SELECT CompanyName,ContactName, Country FROM Customer;

-- lista country występująca w tabeli customer 
SELECT DISTINCT Country FROM Customer;
SELECT DISTINCT Country FROM Customer ORDER BY Country;

-- Distinct dla 2 kolumn zwraca listę unikalnych KOMBINACJI 

SELECT DISTINCT Country, City  FROM Customer ORDER BY 1,2;