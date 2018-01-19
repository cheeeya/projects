DROP TABLE if exists users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) references users(id)
);

DROP TABLE if exists question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  following_user_id INTEGER,

  FOREIGN KEY (question_id) references questions(id),
  FOREIGN KEY (following_user_id) references users(id)
);

DROP TABLE if exists replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  og_question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  reply_author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (og_question_id) references questions(id),
  FOREIGN KEY (parent_reply_id) references replies(id),
  FOREIGN KEY (reply_author_id) references users(id)
);

DROP TABLE if exists question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) references questions(id),
  FOREIGN KEY (user_id) references users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('John', 'Smith'),
  ('Jane', 'Doe');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('What is up?', 'Hello I''m John', (SELECT id FROM users WHERE fname = 'John' AND lname = 'Smith')),
  ('What color?', 'Help I''m colorblind', (SELECT id FROM users WHERE fname = 'Jane' AND lname = 'Doe'));

INSERT INTO
  question_follows (question_id, following_user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'What is up?'),(SELECT id FROM users WHERE fname = 'John' AND lname = 'Smith')),
  ((SELECT id FROM questions WHERE title = 'What color?'),(SELECT id FROM users WHERE fname = 'John' AND lname = 'Smith')),
  ((SELECT id FROM questions WHERE title = 'What color?'),(SELECT id FROM users WHERE fname = 'Jane' AND lname = 'Doe'));

INSERT INTO
  replies (og_question_id, parent_reply_id, reply_author_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'What is up?'), NULL, (SELECT id FROM users WHERE fname = 'Jane' AND lname = 'Doe'), 'Hi I''m Jane'),
  ((SELECT id FROM questions WHERE title = 'What is up?'), 1, (SELECT id FROM users WHERE fname = 'John' AND lname = 'Smith'), 'Hi Jane welome');

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'What is up?'),(SELECT id FROM users WHERE fname = 'John' AND lname = 'Smith')),
  ((SELECT id FROM questions WHERE title = 'What is up?'),(SELECT id FROM users WHERE fname = 'Jane' AND lname = 'Doe'));
