# Project #1: Library Management System

### Project Description
It's a Library Management System that allows users to manage books, authors, members, and borrowing transactions.
This project involves creating and managing multiple tables, performing various types of queries, and handling data modifications.

### Tables Schema
1. **Books Table**
    - Columns: `book_id`, `title`, `author_id`, `genre`, `published_date`, `isbn`, `copies_available`
    - Constraints: `book_id` as primary key, `isbn` as unique, `copies_available` should be non-negative.
    - Relations: `author_id` points to an Author in Authors Table.

2. **Authors Table**
    - Columns: `author_id`, `first_name`, `last_name`, `birthdate`
    - Constraints: `author_id` as primary key, names must not have spaces.

3. **Members Table**
    - Columns: `member_id`, `first_name`, `last_name`, `email`, `join_date`
    - Constraints: `member_id` as primary key, `email` as unique, names must not have spaces.

4. **Borrowing Transactions Table**
    - Columns: `transaction_id`, `book_id`, `member_id`, `borrow_date`, `return_date`
    - Constraints: `transaction_id` as primary key, `book_id` and `member_id` as foreign keys.
    - Relations: `book_id` points to a Book in  books Table, same thing with `member_id`

### ERD Diagram
![image](https://github.com/user-attachments/assets/1d690303-e323-4bab-bc70-0a3ebdf93df0)


### Skills Applied
1. **Data Definition Language (DDL):**
   - Creating custom data types (`CREATE TYPE`).
   - Creating domains with constraints (`CREATE DOMAIN`).
   - Creating tables with primary keys, foreign keys, and constraints (`CREATE TABLE`).

2. **Data Manipulation Language (DML):**
   - Inserting data into tables (`INSERT INTO`).
   - Updating existing records (`UPDATE`).
   - Deleting records (`DELETE`).

3. **Data Querying:**
   - Selecting data from tables (`SELECT`).
   - Joining tables to retrieve related data (`JOIN`).
   - Using aggregate functions (`COUNT`, `AVG`).
   - Filtering data with `WHERE` clauses.
   - Grouping data (`GROUP BY`).
   - Ordering data (`ORDER BY`).
   - Using subqueries.

4. **Constraints and Data Integrity:**
   - Defining primary keys and foreign keys.
   - Using `CHECK` constraints to enforce data integrity.
   - Ensuring unique values with `UNIQUE` constraints.

5. **Transactions:**
   - Using `BEGIN` and `COMMIT` to manage transactions.
   - Ensuring atomicity of operations within transactions.

6. **Date and Time Functions:**
   - Using date functions to filter and manipulate date values (`CURRENT_DATE`, `EXTRACT`, `date_trunc`).

7. **Conditional Logic:**
   - Using `COALESCE` to handle NULL values.

8. **Backup and Restore:**
   - Using `COPY` to import and export data to and from CSV files.

9. **Advanced SQL Techniques:**
   - Using `HAVING` to filter groups.
   - Using `LIMIT` to restrict the number of results.
   - Using `ROUND` to format numerical results.

10. **Error Handling and Validation:**
    - Using constraints to prevent invalid data entry.
    - Planning for triggers to enforce complex business rules (though not implemented in the provided scripts).
