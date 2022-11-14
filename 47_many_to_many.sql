DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS fb_group;

CREATE TABLE user(	
		id 		INTEGER PRIMARY KEY,
		nick  	TEXT NOT NULL
);

CREATE TABLE fb_group(	
		id 			INTEGER PRIMARY KEY,
		group_name	TEXT NOT NULL
);

INSERT INTO user (nick)
VALUES ('karol123'),
		('mos222'),
		('nowe');
		
SELECT * FROM user;

INSERT INTO fb_group(group_name)
VALUES ('Python'),
		('sql'),
		('football');

SELECT * FROM fb_group;	

CREATE TABLE bridge(
		user_id INTEGER REFERENCES user(id),
		fb_group_id INTEGER REFERENCES fb_group(id),
		PRIMARY KEY (user_id, fb_group_id)
);

INSERT INTO bridge(user_id,fb_group_id)
VALUES (1,2),
		(1,3),
		(2,3),
		(3,3),
		(3,2),
		(3,1);
		
SELECT * FROM bridge;


-- najpierw musimy usunąć tabelę bridge 
DROP TABLE IF EXISTS bridge;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS fb_group;
