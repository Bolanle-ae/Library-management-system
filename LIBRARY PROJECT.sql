DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS borrowers;
  
CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    genre VARCHAR(255),
    year_published INT
);

CREATE TABLE authors (
    id INT PRIMARY KEY,
    fullname VARCHAR(255),
    nationality VARCHAR(255)
);

CREATE TABLE borrowers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255)
);

ALTER TABLE books
ADD FOREIGN KEY (author_id) REFERENCES authors(id);

INSERT INTO authors (id, fullname, nationality)
VALUES
(1, "Aile Davidovics", "Peru"),
(2, "Goraud Tong", "Azerbaijan"),
(3, "Gypsy Gault", "Indonesia"),
(4, "Onfroi Whitelaw", "Portugal"),
(5, "Dolley Sarfati", "Sweden"),
(6, "Anabelle Blazdell", "France"),
(7, "Karlene O'Currine", "China");

INSERT INTO books (id, title, author_id, genre, year_published)
VALUES
(1, "Trash", 1, "Thriller", 2011),
(2, "Woman Under the Influence, A", 2, "Drama", 2006),
(3, "Looking for Maria Sanchez", 3, "Romance", 1984),
(4, "Given Word, The (O Pagador de Promessas)", 4, "Drama", 1983),
(5, "Female Trouble", 5, "Comedy", 2010),
(6, "Best Worst Movie", 6, "Documentary", 2011),
(7, "Her", 7, "Drama", 1990);

INSERT INTO borrowers (id, name, address)
VALUES
(1, "Katharine Capper", "1 Lotheville Place"),
(2, "Archaimbaud Lydden", "18924 Sommers Way"),
(3, "Bernadina Castagne", "46 Sherman Alley");

-- - Query 1: Retrieve all books
SELECT * FROM books;

-- Query 2: Retrieve all authors
SELECT * FROM authors;

-- Query 3: Retrieve all borrowers
SELECT * FROM borrowers;

-- Query 4: Retrieve books by a specific author
SELECT* FROM books WHERE author_id = (SELECT id FROM authors WHERE fullname = 'Aile Davidovics');

-- Query 5: Retrieve books published after a specific year 
SELECT * FROM books WHERE year_published > 2006;

-- Query 6: Retrieve the number of books in each genre
SELECT genre, COUNT(*) AS count FROM books GROUP BY genre;


-- Query 7: Retrieve the books borrowed by a specific borrower (replace Borrower1 with the desired borrower's name)
SELECT books.* FROM books
JOIN borrowers ON books.id = borrowers.id
WHERE borrowers.name = 'Katharine Capper';

-- Query 8: Retrieve the books borrowed by a specific borrower and not returned yet (replace Borrower2 with the desired borrower's name)
SELECT books.* FROM books
INNER JOIN borrowers ON books.id = borrowers.id
WHERE borrowers.name = 'Archaimbaud Lydden';

-- Query 9: Retrieve the books written by authors of a specific nationality
SELECT books.* FROM books
JOIN authors ON books.author_id = authors.id
WHERE authors.nationality = 'Sweden';
