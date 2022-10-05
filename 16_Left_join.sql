DROP TABLE IF EXISTS user_group;
DROP TABLE IF EXISTS user;

CREATE TABLE user_group (
		id            INTEGER PRIMARY KEY,
		group_name    TEXT      NOT NULL
);
CREATE TABLE user (
		id             INTEGER PRIMARY KEY,
		first_name     TEXT      NOT NULL,
		user_group_id  INTEGER   NOT NULL
);

INSERT INTO user_group (group_name)
VALUES ('admin'),
		('user'),
		('tester'),
		('developer');
INSERT INTO user(first_name,user_group_id)
VALUES ('John',1),
		('Adam',2),	
		('Mark',5),
		('Philip',3);
		
SELECT * FROM user;
SELECT * FROM user_group;

SELECT * 
FROM USER 
LEFT JOIN user_group ON user.user_group_id == user_group.id;

SELECT first_name,group_name 
FROM USER 
LEFT JOIN user_group ON user.user_group_id == user_group.id;

SELECT first_name,group_name 
FROM USER 
LEFT JOIN user_group ON user.user_group_id == user_group.id;


-- ponieważ mamy dwie kolumny id to zapytanie poniżej zwróci błąd: ambiguous column name: id 
SELECT id, first_name,group_name 
FROM USER 
LEFT JOIN user_group ON user.user_group_id == user_group.id;

SELECT user.id, 
	   first_name,
	   group_name 
FROM USER 
LEFT JOIN user_group ON user.user_group_id == user_group.id;


SELECT t1.id, 
	   t2.id,
	   first_name,
	   group_name 
FROM USER AS t1
LEFT JOIN user_group AS t2 ON t1.user_group_id == t2.id;

SELECT t1.id, 
	   t2.id,
	   t1.first_name,
	   t2.group_name  AS sector
FROM USER AS t1
LEFT JOIN user_group AS t2 ON t1.user_group_id == t2.id
ORDER BY 3;
		