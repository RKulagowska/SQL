
/* 
You are given three tables: Students, Friends and Packages. Students contains two columns: 
ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
Write a query to output the names of those students whose best friends got offered a higher salary 
than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed 
that no two students got same salary offer.
*/

SELECT S.Name
FROM STUDENTS AS S 
JOIN FRIENDS AS F ON S.ID = F.ID
JOIN PACKAGES AS P ON F.ID = P.ID
JOIN PACKAGES AS P2 ON F.FRIEND_ID = P2.ID 
WHERE P.SALARY < P2.SALARY
ORDER BY P2.SALARY;

/*
You are given a table, BST, containing two columns: N and P, where N represents the value of a node
in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of 
the following for each node:
Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/

SELECT N,
       CASE 
        WHEN P IS NULL THEN 'Root'
        WHEN N IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
        END as Value
FROM BST
ORDER BY N;
