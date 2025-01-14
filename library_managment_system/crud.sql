 -- Basic CRUD operations
-- Create a New Author
INSERT INTO
  authors (first_name, last_name, birthdate)
VALUES
  ('Mostafa', 'Mahmoud', '12-02-2003');

-- Create a New Book
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
    'The Art of TypeScript',
    (
      SELECT
        author_id
      FROM
        authors
      WHERE
        first_name = 'Mostafa'
        AND last_name = 'Mahmoud'
      LIMIT
        1
    ),
    'SELF_HELP',
    '12-20-2020', -- Date is MM-DD-YYYY
    '978-0-4979-4756-5',
    10
  );

-- Create a New Member
INSERT INTO
  members (first_name, last_name, email, join_date)
VALUES
  ('John', 'Doe', 'johndoe@email.com', '10-10-2010');

--  Create a New Borrowing Transaction
INSERT INTO
  borrowing_transactions (book_id, member_id, borrow_date, return_date)
VALUES
  (1, 1, '10-10-2020', NULL);

-- Read All Books
SELECT
  *
FROM
  books;

-- Read All Members
SELECT
  *
FROM
  members;

-- Update Book Information
UPDATE
  books
SET
  title = 'Updated Title',
  genre = 'SCIENCE_FICTION',
  copies_available = 10
WHERE
  book_id = 1;

-- Update Member Information
UPDATE
  members
SET
  email = 'updated@email.com',
  join_date = '12-12-2012'
WHERE
  member_id = 1;

-- Delete a Book
DELETE FROM
  books
WHERE
  book_id = 10;

-- Delete a Member
DELETE FROM
  members
WHERE
  member_id = 10;

-- Advanced CRUD Operations
-- Get Books by a Specific Author
SELECT
  b.title AS "Books by Mostafa Mahmoud"
FROM
  books b
  JOIN authors a ON a.author_id = b.author_id
WHERE
  a.first_name = 'Mostafa'
  AND a.last_name = 'Mahmoud';

-- Get Books by Genre
SELECT
  b.title AS "Science Fiction Books"
FROM
  books b
WHERE
  b.genre = 'SCIENCE_FICTION';

-- Books Currently Borrowed by a Specific Member
SELECT
  b.title,
  bt.borrow_date,
  bt.return_date
FROM
  borrowing_transactions bt
  JOIN members m ON m.member_id = bt.member_id
  JOIN books b ON b.book_id = bt.book_id
WHERE
  m.first_name = 'John'
  AND bt.return_date IS NULL;

-- Get Overdue Books
SELECT
  (m.first_name || ' ' || m.last_name) as "Member who borrowed",
  b.title as "Overdue Book Title"
FROM
  borrowing_transactions bt
  JOIN books b ON bt.book_id = b.book_id
  JOIN members m ON bt.member_id = m.member_id
WHERE
  bt.return_date IS NULL
  AND bt.due_date < CURRENT_DATE;

-- Get Most Borrowed Books
SELECT
  b.title,
  count(b.title)
FROM
  borrowing_transactions bt
  JOIN books b ON bt.book_id = b.book_id
GROUP BY
  b.title
ORDER BY
  count(b.title) DESC
LIMIT
  10;

-- Replace with N
-- Get Members Who Borrowed a Specific Book
SELECT
  (m.first_name || ' ' || m.last_name) as "Memeber Name"
FROM
  borrowing_transactions bt
  JOIN members m ON m.member_id = bt.member_id
  JOIN books b ON b.book_id = bt.book_id
WHERE
  b.title = 'Updated Title';

-- Update Book Copies After Borrowing
-- TODO: Should be a trigger when you learn about that
UPDATE
  books
SET
  copies_available = copies_available - 1
WHERE
  book_id = 1;

 -- Replace with one coming from the trigger
-- Update Book Copies After Returning
-- TODO: Should be a trigger when you learn about that
UPDATE
  books
SET
  copies_available = copies_available + 1
WHERE
  book_id = 1 -- Replace with one coming from the trigger
  -- Delete Borrowing Transactions for a Member
DELETE FROM
  borrowing_transactions
WHERE
  member_id = 10;

-- Get Books Borrowed Within a Date Range
SELECT
  b.title AS "Books borrowed between a range"
FROM
  borrowing_transactions bt
  JOIN books b ON b.book_id = bt.book_id
WHERE
  bt.borrow_date BETWEEN '10-10-2021' AND '10-10-2023';

-- Get Authors with Multiple Books
SELECT
  (a.first_name || ' ' || a.last_name) as "Author Name"
FROM
  authors a
  JOIN books b ON a.author_id = b.author_id
GROUP BY
  a.author_id
HAVING
  COUNT(b.book_id) > 1;

-- Get Books and Their Authors
SELECT
  b.title AS "Book Title",
  (a.first_name || ' ' || a.last_name) AS "Author Name"
FROM
  books b
  JOIN authors a ON b.author_id = a.author_id
ORDER BY
  a.first_name,
  a.last_name;

-- Get Borrowing History for a Member
SELECT
  (m.first_name || ' ' || m.last_name) AS "Member Name",
  b.title AS "Book Title",
  bt.borrow_date AS "Borrow Date",
  COALESCE(bt.return_date, 'Not yet returned') AS "Return Date"
FROM
  borrowing_transactions bt
  JOIN books b ON bt.book_id = b.book_id
  JOIN members m ON bt.member_id = m.member_id;

-- Get Books Not Borrowed in the Last Year
SELECT
  b.title AS "Book Title"
FROM
  borrowing_transactions bt
  JOIN books b ON bt.book_id = b.book_id
WHERE
  EXTRACT(
    year
    FROM
      bt.borrow_date
  ) != '2024';

-- Get Total Number of Books Borrowed by Genre
SELECT
  b.genre AS "Book Genre",
  COUNT(b.book_id) AS "Book Count"
FROM
  borrowing_transactions bt
  JOIN books b ON bt.book_id = b.book_id
GROUP BY
  b.genre
ORDER BY
  COUNT(b.book_id) DESC,
  b.genre;

-- Get Average Borrowing Duration
SELECT
  ROUND(AVG(bt.return_date - bt.borrow_date), 2) AS "Average duration for borrowing books in days"
FROM
  borrowing_transactions bt;

-- Get Members Who Borrowed Books from All Genres
SELECT
  (m.first_name || ' ' || m.last_name) AS "Memeber Name"
FROM
  borrowing_transactions bt
  JOIN members m ON bt.member_id = m.member_id
  JOIN books b ON bt.book_id = b.book_id
GROUP BY
  m.member_id
HAVING
  COUNT(DISTINCT b.genre) = (
    SELECT
      COUNT(DISTINCT genre)
    FROM
      books
  );

-- Get Books with Multiple Copies Available
SELECT
  b.title
FROM
  books b
WHERE
  b.copies_available > 1;

-- Get Members Who Joined in the Last Month
SELECT
  (m.first_name || ' ' || m.last_name) AS "Memeber Name",
  m.join_date AS "Joined At"
FROM
  members m
WHERE
  m.join_date >= date_trunc('month', CURRENT_DATE) - INTERVAL '1 month'
  AND m.join_date < date_trunc('month', CURRENT_DATE);
