DROP TABLE transactions;
DROP TABLE tags;

CREATE TABLE tags
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);


CREATE TABLE transactions
(
  id SERIAL8 primary key,
  shop VARCHAR(255) not null,
  value REAL,
  tag_id INT8 references tags(id)
);

