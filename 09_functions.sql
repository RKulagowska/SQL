SELECT * FROM Product;

SELECT COUNT(*) FROM Product;
SELECT COUNT(1) AS TotalRows FROM Product;

SELECT SupplierId FROM Product;

SELECT COUNT(SupplierId) FROM Product;

-- ile jest różnych wartości 
SELECT COUNT(DISTINCT SupplierId) FROM Product;
SELECT COUNT(DISTINCT SupplierId) AS NumberOfSuppliers FROM Product;

-- COUNT i NULL . COUNT nie zlicza null przy zapisie 3 .  
SELECT * FROM Customer;
SELECT FAX  FROM Customer;
SELECT COUNT(FAX) FROM Customer;

-- SUM 
SELECT SUM(UnitPrice) FROM Product;

-- AVG 
SELECT AVG(UnitPrice) FROM Product;
SELECT AVG(DISTINCT UnitPrice) FROM Product;

-- MIN 
SELECT MIN(UnitPrice) FROM Product;

-- MAX 
SELECT MAX(UnitPrice) FROM Product;

-- UPPER 

SELECT CategoryName, Description FROM Category;
SELECT UPPER (CategoryName) AS CategoryName, Description FROM Category;
SELECT LOWER (CategoryName) AS CategoryName, Description FROM Category;

-- LENGTH
SELECT LENGTH (CategoryName) AS LenghtCategory, Description FROM Category;
SELECT CategoryName, LENGTH (CategoryName) AS LenghtCategory, Description FROM Category;

-- typeof

SELECT TYPEOF (3);
SELECT TYPEOF (3.5);
SELECT TYPEOF ('python');
SELECT TYPEOF (NULL);

SELECT CategoryName, TYPEOF(CategoryName), Description FROM Category; 



