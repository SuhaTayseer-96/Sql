create database library
create table Books (Book_ID int, Title varchar(30), Author_ID int, Published_Year int, CopiesAvailable int, BookCategory varchar (100));
create table Authors (AuthorID int, FirstName varchar(50), LastName varchar(50),BirthYear int);
insert into Books 
values (1, 'And Then there were none', 55678, 1939, 5, 'crime & mystery');
insert into Books
values (2, 'My Sweet Orange tree', 4530, 1968, 2, 'Poverty & starvation');
insert into Books
values (3, 'The Overcoat', 4530, 1842, 2, 'Satire');
insert into Authors 
values (55678, 'Agatha ', 'Christie', 1925);
insert into Authors
values (4530, 'Jose', 'Mauro', 1930);
insert into Authors
values (4522, 'Nikolai', 'Gogol', 1920);

select * from Books;
select * from Authors;

select max (CopiesAvailable) from Books;
select min (CopiesAvailable) from Books;

select avg (Published_Year) from Books;
select count (Book_ID) from Books;

--truncate table Books;
--drop table Authors;