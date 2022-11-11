SELECT * FROM CATEGORY;
SELECT * FROM northwind.CATEGORY;

CREATE TABLE northwind.CategoryCopy as SELECT * FROM northwind.Category;

DROP TABLE northwind.CategoryCopy;

SELECT CompanyName,ContactName,ContactTitle FROM Customer;

CREATE TABLE report AS SELECT CompanyName,ContactName,ContactTitle FROM Customer;
