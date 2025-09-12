
CREATE TABLE books (
    id INT PRIMARY KEY IDENTITY,
    title VARCHAR(100) NOT NULL,  
    author VARCHAR(100) NOT NULL, 
    genre  VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    published_year INT,
    added_at VARCHAR(10), 
);
INSERT INTO books (title,author,genre,price,stock,published_year,added_at)
VALUES
('Kay�p Zaman�n �zinde','M. Proust','roman', 129.90, 25, 1913, '2025-08-20'),
('Simyac�','P. Coelho','roman', 89.50, 40, 1988, '2025-08-21'),
('Sapiens','Y. N. Harari','tarih', 159.00, 18, 2011, '2025-08-25'),
('�nce Memed','Y. Kemal','roman', 99.90, 12, 1955, '2025-08-22'),
('K�rl�k','J. Saramago','roman', 119.00, 7, 1995, '2025-08-28'),
('Dune','F. Herbert','bilim', 149.00, 30, 1965, '2025-09-01'),
('Hayvan �iftli�i','G. Orwell','roman', 79.90, 55, 1945, '2025-08-23'),
('1984','G. Orwell','roman', 99.00, 35, 1949, '2025-08-24'),
('Nutuk','M. K. Atat�rk','tarih', 139.00, 20, 1927, '2025-08-27'),
('K���k Prens','A. de Saint-Exup�ry','�ocuk', 69.90, 80, 1943, '2025-08-26'),
('Ba�lang��','D. Brown','roman', 109.00, 22, 2017, '2025-09-02'),
('Atomik Al��kanl�klar','J. Clear','ki�isel geli�im', 129.00, 28, 2018, '2025-09-03'),
('Zaman�n K�sa Tarihi','S. Hawking','bilim', 119.50, 16, 1988, '2025-08-29'),
('�eker Portakal�','J. M. de Vasconcelos','roman', 84.90, 45, 1968, '2025-08-30'),
('Bir �dam Mahk�munun Son G�n�','V. Hugo','roman', 74.90, 26, 1829, '2025-08-31');

SELECT title, author, price
FROM books
ORDER BY price ASC;  -- ASC: K���kten b�y��e

SELECT title, author, genre
FROM books
WHERE genre = 'roman'
ORDER BY title ASC;

SELECT title, author, price
FROM books
WHERE price BETWEEN 80 AND 120;

SELECT title, stock
FROM books
WHERE stock < 20;

SELECT title, author
FROM books
WHERE title LIKE '%zaman%';

SELECT title, author, genre
FROM books
WHERE genre IN ('roman', 'bilim');

SELECT title, author, published_year
FROM books
WHERE published_year >= 2000
ORDER BY published_year DESC;

SELECT title, added_at
FROM books
WHERE added_at >= '2025-09-02';

SELECT TOP 5 title, author, price
FROM books
ORDER BY price DESC;

SELECT title,stock,price
FROM books
WHERE stock BETWEEN 30 AND 60
ORDER BY price ASC;