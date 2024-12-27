CREATE DATABASE Library;

USE Library;

CREATE TABLE authors (
	author_ID INT,
    name VARCHAR (255),
    birth_year YEAR,
    nationality VARCHAR (255),
    PRIMARY KEY (author_ID)
);

ALTER TABLE authors MODIFY birth_year INT;

CREATE TABLE books (
	book_ID INT,
    title VARCHAR (255),
    author_ID INT,
    genre VARCHAR (255),
    published_year YEAR,
    available_copies INT,
    PRIMARY KEY (book_ID),
    FOREIGN KEY (author_ID) REFERENCES authors(author_ID)
);

ALTER TABLE books MODIFY published_year INT;

CREATE TABLE borrow_records (
	record_ID INT,
    book_ID INT,
    borrower_name VARCHAR (255),
    borrow_date DATE,
    return_date DATE,
    PRIMARY KEY (record_ID),
    FOREIGN KEY (book_ID) REFERENCES books(book_ID)
);

INSERT INTO authors (author_ID, name, birth_year, nationality) 
VALUES (1, 'George Orwell', 1903, 'British'),
	   (2, 'J.K. Rowling', 1965, 'British'),
	   (3, 'Haruki Murakami', 1949, 'Japanese'),
	   (4, 'Jane Austen', 1775, 'British'),
	   (5, 'Agatha Christie', 1890, 'British');
       
INSERT INTO books (book_ID, title, author_ID, genre, published_year, available_copies) 
VALUES (1, '1984', 1, 'Dystopian', 1949, 5),
	   (2, 'Animal Farm', 1, 'Political Satire', 1945, 3),
	   (3, 'Harry Potter and the Sorcerer\'s Stone', 2, 'Fantasy', 1997, 7),
	   (4, 'Harry Potter and the Chamber of Secrets', 2, 'Fantasy', 1998, 6),
	   (5, 'Norwegian Wood', 3, 'Romance', 1987, 4),
	   (6, 'Kafka on the Shore', 3, 'Magical realism', 2002, 2),
	   (7, 'Pride and Prejudice', 4, 'Romance', 1813, 8),
	   (8, 'Sense and Sensibility', 4, 'Romance', 1811, 5),
	   (9, 'Murder on the Orient Express', 5, 'Mystery', 1934, 6),
	   (10, 'The Murder of Roger Ackroyd', 5, 'Mystery', 1926, 4);

INSERT INTO authors (author_ID, name, birth_year, nationality) 
VALUES (6, 'F. Scott Fitzgerald', 1896, 'American'),
	   (7, 'Mark Twain', 1835, 'American');
       
INSERT INTO books (book_ID, title, author_ID, genre, published_year, available_copies) 
VALUES (11, 'The Great Gatsby', 6, 'Novel', 1925, 5),
	   (12, 'Adventures of Huckleberry Finn', 7, 'Adventure', 1884, 6);
 
-- Record the borrowing
INSERT INTO borrow_records (record_ID, book_ID, borrower_name, borrow_date, return_date) 
VALUES (1, 1, 'Alice', '2024-12-01', NULL),
	   (2, 3, 'Bob', '2024-12-05', NULL),
	   (3, 4, 'Charlie', '2024-12-10', NULL);
       
-- Decrease available copies
UPDATE books
SET available_copies = available_copies - 1
WHERE book_id = 1;

UPDATE books
SET available_copies = available_copies - 1
WHERE book_id = 3;

UPDATE books
SET available_copies = available_copies - 1
WHERE book_id = 4;

-- Update the return date for the borrow record
UPDATE borrow_records
SET return_date = '2024-12-15'
WHERE record_id = 1;

-- Increase available copies
UPDATE books
SET available_copies = available_copies + 1
WHERE book_id = 1;

-- List all available books
SELECT b.book_ID, b.title, a.name AS author_name, b.genre, b.published_year, b.available_copies
FROM books b
JOIN authors a ON b.author_ID = a.author_ID
WHERE b.available_copies > 0;

-- Find books by specific author
SELECT b.book_ID, b.title, a.name AS author_name, b.genre, b.published_year, b.available_copies
FROM books b
JOIN authors a ON b.author_ID = a.author_ID
WHERE a.name = 'Haruki Murakami';

