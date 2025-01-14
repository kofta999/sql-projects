 -- Restore from CSV
COPY
  books (
    book_id,
    title,
    author_id,
    genre,
    published_date,
    isbn,
    copies_available
  )
FROM
  "seed.csv" DELIMITER ',' CSV HEADER;

-- Backup to CSV
COPY
  books (
    book_id,
    title,
    author_id,
    genre,
    published_date,
    isbn,
    copies_available
  ) TO "backup.csv" DELIMITER ',' CSV HEADER;
