use [School Management System]
GO

CREATE SCHEMA Students_Schema;
CREATE SCHEMA FamilyInfo_Schema;
CREATE SCHEMA Courses_Schema;
CREATE SCHEMA Classes_Schema;
CREATE SCHEMA Assignments_Schema;
CREATE SCHEMA Attendance_Schema;


CREATE TABLE Students (ID int, Name varchar (50), LastName varchar (50),  DateOfBirth Date not null, Address varchar(100),
constraint students_pk primary key (ID)
);

CREATE TABLE FamilyInfo (Member_ID int , ID int, FamilyMemb varchar (50), relative_relation varchar (100), Phone varchar(30)
constraint FamilyInfo_pk primary key (Member_ID),
constraint Students_FamilyInfo_fk foreign key (ID) references Students (ID)
);

CREATE TABLE Courses (Course_ID int, name varchar (50) not null, description varchar (100), Resource varchar (30)
constraint Courses_pk primary key (Course_ID),

);

CREATE TABLE Classes (Classes_ID int, Class_Code varchar (50) not null, Room_no varchar (30), Schedule varchar (255)
constraint Classes_pk primary key (Classes_ID),

);

CREATE TABLE Assignments (Assign_ID int, name varchar (50) not null, Description varchar (30), Due_date date, State varchar (30),
constraint Assignments_pk primary key (Assign_ID),

);

CREATE TABLE attendance (Attend_ID int, ID int, AttendanceDate date not null, Type_of_absence varchar (30), Due_date date, State varchar (30),
constraint attendance_pk primary key (Attend_ID),
constraint Students_attendance_fk foreign key (ID) references Students (ID)

);


--1
select * from Students where DateOfBirth = '24-03-1996';
--2
select * from Courses where name = 'Science';
--3
alter table Students add Email varchar (100);
--4
insert into Students values (1, 'SSS', 'TTT', '1-1-2024', 'Jordan-Amman');
--5
select * from Students join FamilyInfo on Students.ID = FamilyInfo.ID;
--6
CREATE TABLE Enrollment (Enroll_ID INT PRIMARY KEY, ID INT foreign key, CourseID INT foreign key,Enroll_Date DATE,
foreign key (ID) references Students (ID),
foreign key (CourseID) references Courses(CourseID),
);

select * from Students 
join Enrollment on Students.ID = Enrollment.ID
join Courses on Enrollment.CourseID = Courses.Course_ID
where Courses.name = 'Math';


select * from Students
join attendance on Students.ID = attendance.ID
where attendance.Type_of_absence = 'leaving' and attendance.AttendanceDate between '10-10-2024' and '20-10-2024';


SELECT Students.Name FROM Students
JOIN attendance ON Students.ID = attendance.ID
WHERE attendance.Type_of_absence = 'absence'
GROUP BY Students.ID, Students.Name
HAVING COUNT(*) > 4;


ALTER TABLE attendance DROP COLUMN Due_date, COLUMN State;