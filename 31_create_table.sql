CREATE TABLE user(
		id INTEGER PRIMARY KEY,
		first name TEXT,
		last_name TEXT,
		email TEXT
);

DROP TABLE user;


CREATE TABLE IF NOT EXISTS user(
		id INTEGER PRIMARY KEY,
		first name TEXT,
		last_name TEXT,
		email TEXT
);

DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS user(
		id INTEGER,
		first name TEXT,
		last_name TEXT,
		email TEXT,
		PRIMARY KEY (id)	
);