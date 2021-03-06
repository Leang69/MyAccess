CREATE TABLE Student (
StudentID INT PRIMARY KEY,
StudentName CHAR(25) NOT NULL,
Gender CHAR(1) NOT NULL,
PhoneNo CHAR(12)
);

CREATE TABLE StudentCard (
StudentID INT NOT NULL UNIQUE REFERENCES Student ON DELETE CASCADE,
IsusedDate DATETIME NOT NULL,
ExpiredDate DATETIME NOT NULL,
UniversityName CHAR(50) NOT NULL
);

CREATE TABLE Department (
DeptID INT PRIMARY KEY,
DeptName CHAR(50) NOT NULL,
HeadName CHAR(25) NOT NULL,
FacultyName CHAR(25) NOT NULL
);

CREATE TABLE Course (
CourseID INT PRIMARY KEY,
CourseName CHAR(25) NOT NULL,
NoOfCredit INT NOT NULL,
NoOfHour INT NOT NULL,
DeptID INT NOT NULL REFERENCES Department ON DELETE CASCADE
);

CREATE TABLE Homework (
HomeworkID INT PRIMARY KEY,
CourseID INT NOT NULL REFERENCES Course ON DELETE CASCADE,
TopicName CHAR(25) NOT NULL,
Content TEXT NOT NULL,
Deadline DATETIME NOT NULL
);

CREATE TABLE DeptDetail (
StudentID INT NOT NULL REFERENCES Student ON DELETE CASCADE,
DeptID INT NOT NULL REFERENCES Department ON DELETE CASCADE,
StartedDate DATETIME NOT NULL
);

CREATE UNIQUE INDEX StuIDDeptIDCk
ON DeptDetail (StudentID, DeptID);

CREATE TABLE StudentDetail (
StudentID INT NOT NULL REFERENCES Student ON DELETE CASCADE,
CourseID INT NOT NULL REFERENCES Course ON DELETE CASCADE,
FinalScore INT NOT NULL
);

CREATE UNIQUE INDEX StuIDCouIDCk
ON StudentDetail (StudentID, CourseID);

CREATE TABLE Teacher (
TeacherID INT PRIMARY KEY,
TeacherName CHAR(25) NOT NULL,
Gender CHAR(1) NOT NULL,
PhoneNo CHAR(12) NOT NULL
);

CREATE TABLE CourseDetail (
TeacherID INT NOT NULL REFERENCES Teacher ON DELETE CASCADE,
CourseID INT NOT NULL REFERENCES Course ON DELETE CASCADE,
NoOfStudent INT NOT NULL
);

CREATE UNIQUE INDEX TeachIDCouIDCk
ON CourseDetail (TeacherID, CourseID);

CREATE TABLE TeacherDetail (
TeachDetailID INT PRIMARY KEY,
StudentID INT NOT NULL REFERENCES Student ON DELETE CASCADE,
TeacherID INT NOT NULL REFERENCES Teacher ON DELETE CASCADE,
RoomNo CHAR(5) NOT NULL,
StartedDate DATETIME NOT NULL,
EndedDate DATETIME NOT NULL,
DayOfWeek CHAR(10)
);

CREATE TABLE DeptTeachDetail(
DeptID INT NOT NULL REFERENCES Course ON DELETE CASCADE,
TeacherID INT NOT NULL REFERENCES Teacher ON DELETE CASCADE,
StartedDate DATETIME NOT NULL
);

CREATE UNIQUE INDEX DeptIDTeachIDCk
ON DeptTeachDetail (DeptID, TeacherID);