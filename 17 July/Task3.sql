CREATE DATABASE Library_System;
CREATE TABLE Authors (AuthorID int primary key, AuthName varchar (50), Bio varchar(550));

CREATE TABLE Categories (CategoriesID int primary key, CategName varchar (50), LastUpdate date,
);

CREATE TABLE Sections (SectionsID int primary key, SecName varchar (50), Discription varchar (550),
);

CREATE TABLE Books (BookID int primary key, Title varchar (550), AuthorID int, PubYear int,
foreign key (AuthorID) references Authors(AuthorID) ON DELETE CASCADE ,
foreign key (CategoriesID) references Categories(CategoriesID) ON DELETE CASCADE, 
foreign key (SectionsID) references Sections(SectionsID) ON DELETE CASCADE, 
);

CREATE TABLE Employees (EmployeesID int primary key, EmpName varchar (50), Position varchar (50),
);

CREATE TABLE Users_ (UserID int primary key, Name varchar (50), Email varchar (225),
);

CREATE TABLE Transaction_ (TransactionID int primary key, UserID int, BookID int, TransactionDate date,
foreign key (UserID) references Users_(UserID) ON DELETE CASCADE, 
foreign key (BookID) references Books(BookID) ON DELETE CASCADE, 
);

-------------------------------
Insert into Authors values 
(1, 'fst Auth', 'Bio of fst Auth'),
(2, 'Sec Auth', 'Bio of Sec Auth'),
(3, '3rd Auth', 'Bio of 3rd Auth'),
(4, '4th Auth', 'Bio of 4th Auth'),
(5, '5th Auth', 'Bio of 5th Auth');

Insert into Categories values
(1, 'Adv', '02-02-2002'),
(2, 'Fic', '03-03-2003'),
(3, 'Mys', '04-04-2004'),
(4, 'Sci', '05-05-2005'),
(5, 'Fant', '06-06-2006');

Insert into Sections values
(1, 'Tech', 'This is Tech section'),
(2, 'Poet', 'This is Poet section'),
(3, 'Art', 'This is Art section'),
(4, 'Science', 'This is Science section'),
(5, 'Fiction', 'This is Fiction section'),

Insert into Books values
(1, '1 Book', 1, 2018),
(2, '2 Book', 2, 2019),
(3, '3 Book', 3, 2020),
(4, '4 Book', 4, 2021),
(5, '5 Book', 5, 2022);


Insert into Employees values
(1, 'Employ-1', 'Position of Employ-1'),
(2, 'Employ-2', 'Position of Employ-2'),
(3, 'Employ-3', 'Position of Employ-3'),
(4, 'Employ-4', 'Position of Employ-4'),
(5, 'Employ-5', 'Position of Employ-5');

Insert into Transaction_ values
(1, 1, 1, '07-07-2007'),
(2, 2, 2, '08-08-2008'),
(3, 3, 3, '09-09-2009'),
(4, 4, 4, '10-10-2010'),
(5, 5, 5, '11-11-2011');


------------------------------------

select Books.Title, Authors.AuthName from Books
Join Authors on Books.AuthorID = Authors.AuthorID;

select Books.Title, Authors.AuthName from Books
right Join Authors on Books.AuthorID = Authors.AuthorID;

select Books.Title, Authors.AuthName from Books
left Join Authors on Books.AuthorID = Authors.AuthorID;

select Books.Title, Authors.AuthName from Books
full outer Join Authors on Books.AuthorID = Authors.AuthorID;

---------------------------------------

select Users_.Name, Transaction_.BookID from Users_
join Transaction_ on Users_.UserID = Transaction_.UserID;

-----Not Sure ----------
--select Users_.Name, Books.Title from Users_
--join Books ON Transaction_.BookID = Books.BookID;

select Users_.Name, Transaction_.Book_ID 
from Users_
right join Transaction_ on Users_.UserID = Transaction_.UserID;

select Users_.Name, Transaction_.Book_ID 
from Users_
left join Transaction_ on Users_.UserID = Transaction_.UserID;


select Users_.Name, Transaction_.Book_ID 
from Users_
full outer Join Transaction_ on Users_.UserID = Transaction_.UserID;
