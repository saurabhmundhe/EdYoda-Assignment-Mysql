CREATE DATABASE IF NOT EXISTS sales;
USE sales;

CREATE TABLE IF NOT EXISTS SalesPeople (
Snum int unsigned not null,
Sname varchar(25) not null default ' ',
City varchar(25) not null default ' ',
Comm int unsigned not null,
PRIMARY KEY (Snum)
);

CREATE TABLE IF NOT EXISTS Customers (
Cnum int unsigned not null,
Cname varchar(25) not null default ' ',
City varchar(25) not null default ' ',
Snum int unsigned not null,
PRIMARY KEY (Cnum),
FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

CREATE TABLE IF NOT EXISTS Orders (
Onum int unsigned not null,
Amt decimal(7,2),
Odate date not null default '0000-00-00',
Cnum int unsigned not null,
Snum int unsigned not null,
PRIMARY KEY (Onum),
FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

INSERT INTO SalesPeople VALUES (1001, 'Peel', 'London', 12),
(1002, 'Serres', 'Sanjose', 13),
(1004, 'Motika', 'London', 11),
(1007, 'Rifkin', 'Barcelona', 15),
(1003, 'Axelrod', 'Newyork', 10);

INSERT INTO Customers VALUES (2001,  'Hoffman',  'London', 1001),
(2002,  'Giovanni',  'Rome', 1003),
(2003,  'Liu',  'Sanjose', 1002),
(2004,  'Grass',  'Berlin', 1002),
(2006,  'Clemens',  'London', 1001),
(2008,  'Cisneros',  'Sanjose', 1007),
(2007,  'Pereira',  'Rome', 1004);

INSERT INTO Orders VALUES (3001, 18.69,  '1990-03-10',  2008, 1007),
(3003,  767.19,  '1990-03-10',  2001, 1001),
(3002,  1900.10,  '1990-03-10',  2007, 1004),
(3005,  5160.45,  '1990-03-10',  2003, 1002),
(3006,  1098.16,  '1990-03-10',  2008, 1007),
(3009,  1713.23,  '1990-04-10',  2002, 1003),
(3007,  75.75,  '1990-04-10',  2004, 1002),
(3008,  4273.00,  '1990-05-10',  2006, 1001),
(3010,  1309.95,  '1990-06-10',  2004, 1002),
(3011,  9891.88,  '1990-06-10',  2006, 1001);
 
SELECT COUNT(Sname) FROM salespeople WHERE Sname LIKE 'A%';

SELECT Snum FROM orders GROUP BY Snum HAVING SUM(Amt) > 2000;

SELECT COUNT(Sname) FROM salespeople WHERE City LIKE 'Newyork';

SELECT COUNT(Sname) FROM salespeople WHERE City LIKE 'London' OR City LIKE 'Paris';

SELECT Snum, Odate, COUNT(*) FROM orders GROUP BY Odate, Snum