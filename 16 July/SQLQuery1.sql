CREATE DATABASE School_System;
create table Teachers(Teacher_ID int primary key, TeacherFname varchar(550));

create table TeacherDetails(TeacherDetails_ID int primary key, Teacher_ID int UNIQUE, TeacherLname varchar(50)
foreign key (Teacher_ID) references Teachers(Teacher_ID)
);

create table Courses(Course_ID int primary key, CourseNme varchar(550), Teacher_ID int
foreign key (Teacher_ID) references Teachers(Teacher_ID)
);

create table Students(Student_ID int primary key, FNme varchar(550), LNme varchar(550));

create table Courser_Students (Course_ID int,Student_ID int
primary key (Course_ID, Student_ID),
foreign key(Course_ID) references Courses (Course_ID),
foreign key(Student_ID) references Students (Student_ID),
);

insert into Teachers values (1, 'ABC'), (2, 'DEF'), (3, 'GHI');
insert into TeacherDetails values (1, 1, 'LLL'), (2, 2, 'MMM'), (3, 3, 'OOO');
insert into Courses values (1, 'sql', 1),(2, 'java', 2), (3, 'c#', 3) ;
insert into Students values (1, 'firstname', 'lastname'), (2, 'secname', 'lstname'), (3, 'thrdname', 'laastname');


insert into Courser_Students (Course_ID,Student_ID) values
(1, 1),
(1, 2),
(2, 3);
