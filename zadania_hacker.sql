
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

/* 
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Input Format
The following tables contain contest data:
•	Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
•	Difficulty: The difficult_level is the level of difficulty of the challenge, and score is the score of the challenge for the difficulty level.
•	Challenges: The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who created the challenge, and difficulty_level is the level of difficulty of the challenge.
•	Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge that the submission belongs to, and score is the score of the submission.
*/

SELECT h.hacker_id, h.name 
FROM Hackers as h 
JOIN Submissions as s ON h.hacker_id = s.hacker_id 
JOIN Challenges as c ON s.challenge_id = c.challenge_id 
JOIN Difficulty as d ON c.difficulty_level = d.difficulty_level AND s.score = d.score 
GROUP BY h.hacker_id, h.name 
HAVING COUNT(s.challenge_id) > 1 
ORDER BY COUNT(s.challenge_id) DESC, h.hacker_id ASC;

/* 
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20).

*/

DECLARE @N INT; SET @N = 20;
WHILE (@N > 0) BEGIN PRINT LEFT(REPLICATE('* ', @N),@N*2-1) SET @N = @N - 1 END;

/* 
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).
*/ 

DECLARE @var int
SELECT @var = 1
WHILE @var <= 20
BEGIN
PRINT replicate('* ', @var)
SET @var = @var + 1
END

/*
The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of
the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id.
Exclude all hackers with a total score of  from your result.
*/

SELECT s.hacker_id,
        y.name,
        SUM(su) AS score
FROM 
(SELECT hacker_id,
       challenge_id,
       max(score) AS su 
FROM Submissions 
GROUP BY hacker_id, challenge_id) AS s
JOIN hackers AS y ON y.hacker_id = s.hacker_id
GROUP BY s.hacker_id,y.name
HAVING score != 0
ORDER BY score DESC, s.hacker_id ASC;

