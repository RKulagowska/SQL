-- polecenia SELECT

SELECT 20;
SELECT 20+4;
SELECT 20-4;
SELECT 20*4;
SELECT 20/5;
-- 21/5 da 4 bo podana wart całkowite 
SELECT 21/5;
-- 21/5.0 da liczbę rzeczywista 4,2
SELECT 21/5.0;

-- modulo zwraca resztę z dzielenia 
SELECT 21%5;

SELECT 'python';

SELECT 'python', 'java';

SELECT 'Sci' || ' & ' || 'Tech';
-- true zwraca wartość 1 a false 0 
SELECT true, false;

SELECT NULL;

SELECT (45.0/42.0)-1;
-- zmiana nagłowka na Daily_return
SELECT (45.0/42.0)-1 AS Daily_return; 
-- 2 kolumna 
SELECT (45.0/42.0)-1 AS Daily_return, 'GWD' AS stock_market; 
