 -- Borrow Book Transaction
BEGIN;
-- TODO: Try adding checks to prevent borrowings with dates before book release, member register, or return dates before borrow dates
-- Need a trigger ^
-- Decrement number of books (should throw error if number is 0)
UPDATE
  books
SET
  copies_available = copies_available - 1
WHERE
  book_id = 1;

-- Add row in borrowing_transactions table
INSERT INTO
  borrowing_transactions (
    book_id,
    member_id,
    borrow_date,
    return_date,
    due_date
  )
VALUES
  (1, 1, '2020-12-12', NULL, '2020-12-20');

COMMIT;

-- Return Book Transaction
BEGIN;

-- Set the return date to today
UPDATE
  borrowing_transactions
SET
  return_date = CURRENT_DATE
WHERE
  transaction_id = 1;

-- Increase book count
UPDATE
  books
SET
  copies_available = copies_available + 1
WHERE
  book_id = 1;

COMMIT;
