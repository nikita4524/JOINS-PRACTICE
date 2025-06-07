create database student;
use student;

--create table--
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Major VARCHAR(50)
);

CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    Name VARCHAR(100),
    Industry VARCHAR(50)
);

CREATE TABLE Job_Postings (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(100),
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    StudentID INT,
    JobID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (JobID) REFERENCES Job_Postings(JobID)
);

---insert sample data--
INSERT INTO Students VALUES
(1, 'Alice', 20, 'Computer Science'),
(2, 'Bob', 21, 'IT'),
(3, 'Charlie', 22, 'ECE');

INSERT INTO Companies VALUES
(1, 'Google', 'Technology'),
(2, 'Amazon', 'E-Commerce');

INSERT INTO Job_Postings VALUES
(1, 1, 'Software Engineer'),
(2, 2, 'Data Analyst');

INSERT INTO Applications VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);


--inner join--
SELECT s.StudentID, s.Name, j.JobTitle
FROM Students s
INNER JOIN Applications a ON s.StudentID = a.StudentID
INNER JOIN Job_Postings j ON a.JobID = j.JobID;

--left join--
SELECT s.StudentID, s.Name, j.JobTitle
FROM Students s
LEFT JOIN Applications a ON s.StudentID = a.StudentID
LEFT JOIN Job_Postings j ON a.JobID = j.JobID;

--Right join--
SELECT s.StudentID, s.Name, j.JobTitle
FROM Students s
RIGHT JOIN Applications a ON s.StudentID = a.StudentID
RIGHT JOIN Job_Postings j ON a.JobID = j.JobID;

--full join--
SELECT s.StudentID, s.Name, j.JobTitle
FROM Students s
FULL OUTER JOIN Applications a ON s.StudentID = a.StudentID
FULL OUTER JOIN Job_Postings j ON a.JobID = j.JobID;

