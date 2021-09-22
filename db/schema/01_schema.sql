DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS poll CASCADE;
DROP TABLE IF EXISTS poll_options CASCADE;
DROP TABLE IF EXISTS user_answers CASCADE;


CREATE TABLE users(
id SERIAL PRIMARY KEY NOT NULL,
email VARCHAR(255) NOT NULL,
admin BOOLEAN DEFAULT FALSE
);

CREATE TABLE poll (
id SERIAL PRIMARY KEY NOT NULL,
creator_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
title VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
admin_link VARCHAR(255) NOT NULL,
user_link VARCHAR(255) NOT NULL,
name_req BOOLEAN DEFAULT FALSE
);

CREATE TABLE poll_options (
id SERIAL PRIMARY KEY NOT NULL,
poll_id INTEGER REFERENCES poll(id) ON DELETE CASCADE,
title VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
points INTEGER DEFAULT 0
);

CREATE TABLE user_answers (
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(255) NOT NULL,
poll_option_id INTEGER REFERENCES poll_options(id) ON DELETE CASCADE
);
