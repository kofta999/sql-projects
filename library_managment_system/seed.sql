INSERT INTO
  authors (first_name, last_name, birthdate)
VALUES
  ('George', 'Orwell', '1903-06-25'),
  ('J.K.', 'Rowling', '1965-07-31'),
  ('J.R.R.', 'Tolkien', '1892-01-03'),
  ('Agatha', 'Christie', '1890-09-15'),
  ('Isaac', 'Asimov', '1920-01-02');

INSERT INTO
  books (
    title,
    author_id,
    genre,
    published_date,
    isbn,
    copies_available
  )
VALUES
  (
    '1984',
    1,
    'FICTION',
    '1949-06-08',
    '9780451524935',
    5
  ),
  (
    'Harry Potter and the Philosopher''s Stone',
    2,
    'FANTASY',
    '1997-06-26',
    '9780747532699',
    10
  ),
  (
    'The Hobbit',
    3,
    'FANTASY',
    '1937-09-21',
    '9780345339683',
    7
  ),
  (
    'Murder on the Orient Express',
    4,
    'MYSTERY',
    '1934-01-01',
    '9780062693662',
    4
  ),
  (
    'Foundation',
    5,
    'SCIENCE_FICTION',
    '1951-06-01',
    '9780553293357',
    6
  );

INSERT INTO
  members (first_name, last_name, email, join_date)
VALUES
  (
    'John',
    'Doe',
    'john.doe@example.com',
    '2022-01-15'
  ),
  (
    'Jane',
    'Smith',
    'jane.smith@example.com',
    '2022-02-20'
  ),
  (
    'Alice',
    'Johnson',
    'alice.johnson@example.com',
    '2022-03-10'
  ),
  (
    'Bob',
    'Brown',
    'bob.brown@example.com',
    '2022-04-05'
  ),
  (
    'Charlie',
    'Davis',
    'charlie.davis@example.com',
    '2022-05-12'
  );

INSERT INTO
  borrowing_transactions (book_id, member_id, borrow_date, return_date)
VALUES
  (1, 1, '2022-06-01', '2022-06-15'),
  (2, 2, '2022-06-05', '2022-06-20'),
  (3, 3, '2022-06-10', '2022-06-25'),
  (4, 4, '2022-06-15', '2022-06-30'),
  (5, 5, '2022-06-20', NULL); -- NULL return_date indicates the book has not been returned yet
