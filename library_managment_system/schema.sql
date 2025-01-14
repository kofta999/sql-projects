CREATE TYPE
  BookGenre AS ENUM(
    'FICTION',
    'NON_FICTION',
    'MYSTERY',
    'FANTASY',
    'SCIENCE_FICTION',
    'BIOGRAPHY',
    'HISTORY',
    'ROMANCE',
    'THRILLER',
    'CHILDREN',
    'YOUNG_ADULT',
    'SELF_HELP',
    'POETRY',
    'CLASSICS',
    'GRAPHIC_NOVEL'
  );

CREATE DOMAIN
  SingleName AS VARCHAR NOT NULL CHECK (value !~ '\s');

CREATE TABLE
  authors (
    author_id SERIAL PRIMARY KEY,
    first_name SingleName,
    last_name SingleName,
    birthdate DATE NOT NULL
  );

CREATE TABLE
  members (
    member_id SERIAL PRIMARY KEY,
    first_name SingleName,
    last_name SingleName,
    email TEXT UNIQUE NOT NULL,
    join_date DATE NOT NULL
  );

CREATE TABLE
  books (
    book_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INT NOT NULL,
    genre BookGenre NOT NULL,
    published_date DATE NOT NULL,
    isbn VARCHAR(17) NOT NULL UNIQUE, -- Considering ISBN 13 + 4 hyphens
    copies_available INT DEFAULT 0 CHECK (copies_available >= 0),
    FOREIGN KEY (author_id) REFERENCES authors (author_id)
  );

CREATE TABLE
  borrowing_transactions (
    transaction_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books (book_id),
    FOREIGN KEY (member_id) REFERENCES members (member_id)
  );
