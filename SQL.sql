
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- =========================
-- Cars Table
-- =========================
CREATE TABLE Cars
(
    Plate_No VARCHAR(10) PRIMARY KEY,
    Model VARCHAR(50),
    Color VARCHAR(20)
);

-- =========================
-- Departments Table
-- =========================
CREATE TABLE Departments
(
    Depart_Code INT PRIMARY KEY,
    Depart_Name VARCHAR(30),
    Manager_Id INT,
    Hiring_Date DATE
);

-- =========================
-- Employees Table
-- =========================
CREATE TABLE Employees
(
    ID INT NOT NULL,
    SSN INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2) DEFAULT 5000,
    Cont_Id VARCHAR(10) NOT NULL UNIQUE,
    Cont_Type VARCHAR(20) NOT NULL,
    Cont_St_Date DATE NOT NULL,
    Dept_Id INT,
    Date_Of_Birth DATE,
    Street VARCHAR(50),
    Zone VARCHAR(50),
    Car_No VARCHAR(10),

    CONSTRAINT Emp_PK PRIMARY KEY (SSN),

    CONSTRAINT Sal_Chk
    CHECK (Salary BETWEEN 5000 AND 25000),

    CONSTRAINT Emp_Car_FK
    FOREIGN KEY (Car_No)
    REFERENCES Cars(Plate_No),

    CONSTRAINT Emp_Dept_FK
    FOREIGN KEY (Dept_Id)
    REFERENCES Departments(Depart_Code)
);

-- =========================
-- Employee Phones Table
-- Multi-Valued Attribute
-- =========================
CREATE TABLE Emp_Phones
(
    Phone_No VARCHAR(20),
    Emp_SSN INT,

    CONSTRAINT Emp_Phones_PK
    PRIMARY KEY (Phone_No, Emp_SSN),

    CONSTRAINT Emp_Phones_FK
    FOREIGN KEY (Emp_SSN)
    REFERENCES Employees(SSN)
);

-- =========================
-- Departments Locations Table
-- =========================
CREATE TABLE Departs_Locations
(
    Dept_No INT,
    Dept_Location VARCHAR(50),

    CONSTRAINT Dept_Loc_PK
    PRIMARY KEY (Dept_No, Dept_Location),

    CONSTRAINT Dept_Loc_FK
    FOREIGN KEY (Dept_No)
    REFERENCES Departments(Depart_Code)
);

-- =========================
-- Dependants Table
-- Weak Entity
-- =========================
CREATE TABLE Dependants
(
    Dep_Name VARCHAR(30),
    Relation VARCHAR(20),
    Emp_SSN INT,

    CONSTRAINT Dep_PK
    PRIMARY KEY (Dep_Name, Emp_SSN),

    CONSTRAINT Dep_FK
    FOREIGN KEY (Emp_SSN)
    REFERENCES Employees(SSN)
);

-- =========================
-- Skills Table
-- =========================
CREATE TABLE Skills
(
    Sk_Id VARCHAR(10) PRIMARY KEY,
    Sk_Name VARCHAR(30)
);

-- =========================
-- Projects Table
-- =========================
CREATE TABLE Projects
(
    Proj_Id VARCHAR(10) PRIMARY KEY,
    Proj_Name VARCHAR(50)
);

-- =========================
-- Employees_Projects Table
-- M:N Relationship
-- =========================
CREATE TABLE Employees_Projects
(
    Emp_No INT,
    Proj_REF VARCHAR(10),
   
    CONSTRAINT EMP_PROJS_PK
    PRIMARY KEY (Emp_No, Proj_REF),

    CONSTRAINT Emp_Proj_Emp_FK
    FOREIGN KEY (Emp_No)
    REFERENCES Employees(SSN),

    CONSTRAINT Emp_Proj_Proj_FK
    FOREIGN KEY (Proj_REF)
    REFERENCES Projects(Proj_Id)
);

-- =========================
-- Ternary Relationship Table
-- =========================
CREATE TABLE Emp_Skills_Used_Projects
(
    Emp_Id INT,
    Skill_Id VARCHAR(10),
    Proj_Id VARCHAR(10),

    CONSTRAINT EMP_SK_PROJ_PK
    PRIMARY KEY (Emp_Id, Skill_Id, Proj_Id),

    CONSTRAINT Emp_Sk_PROJ_FK
    FOREIGN KEY (Emp_Id)
    REFERENCES Employees(SSN),

    CONSTRAINT Sk_Emp_PROJ_FK
    FOREIGN KEY (Skill_Id)
    REFERENCES Skills(Sk_Id),

    CONSTRAINT PROJ_Emp_Sk_FK
    FOREIGN KEY (Proj_Id)
    REFERENCES Projects(Proj_Id)
);

-- =========================
-- INSERT DATA INTO Cars
-- =========================
INSERT INTO Cars VALUES
('ABC123', 'Toyota Corolla', 'Blue'),
('XYZ789', 'Honda Civic', 'Red'),
('LMN456', 'Ford Focus', 'Black');

-- =========================
-- INSERT DATA INTO Departments
-- =========================
INSERT INTO Departments VALUES
(10, 'HR', 101, '2020-01-01'),
(20, 'IT', 102, '2019-05-15'),
(30, 'Finance', 103, '2021-09-10');

-- =========================
-- INSERT DATA INTO Employees
-- =========================
INSERT INTO Employees VALUES
(1, 101, 'Ali Hassan', 7000, 'C001', 'FullTime',
'2022-01-01', 10, '1990-05-15',
'Main St', 'ZoneA', 'ABC123');

INSERT INTO Employees VALUES
(2, 102, 'Sara Ahmed', 9000, 'C002', 'PartTime',
'2023-03-01', 20, '1988-07-20',
'Elm St', 'ZoneB', 'XYZ789');

INSERT INTO Employees VALUES
(3, 103, 'Omar Youssef', 12000, 'C003', 'Contract',
'2021-06-15', 10, '1995-11-10',
'Pine St', 'ZoneC', 'LMN456');

INSERT INTO Employees VALUES
(4, 104, 'Ahmed Hany', 24999, 'C004', 'Contract',
'2021-01-15', 10, '2000-05-10',
'Luxor St', 'Sporting', NULL);

-- =========================
-- INSERT DATA INTO Emp_Phones
-- =========================
INSERT INTO Emp_Phones VALUES
('01012345678', 101),
('01198765432', 102),
('01234567890', 103);

-- =========================
-- INSERT DATA INTO Departs_Locations
-- =========================
INSERT INTO Departs_Locations VALUES
(10, 'Alexandria'),
(20, 'Cairo'),
(30, 'Giza'),
(30, 'Aswan'),
(20, 'Alexandria'),
(10, 'Cairo');

-- =========================
-- INSERT DATA INTO Dependants
-- =========================
INSERT INTO Dependants VALUES
('Mona', 'Daughter', 101),
('Khaled', 'Son', 101),
('Nour', 'Sister', 103);

-- =========================
-- INSERT DATA INTO Skills
-- =========================
INSERT INTO Skills VALUES
('SK1', 'Java'),
('SK2', 'SQL'),
('SK3', 'Python');

-- =========================
-- INSERT DATA INTO Projects
-- =========================
INSERT INTO Projects VALUES
('P1', 'Payroll System'),
('P2', 'E-Commerce Website'),
('P3', 'Mobile Banking App');

-- =========================
-- INSERT DATA INTO Employees_Projects
-- =========================
INSERT INTO Employees_Projects VALUES
(101, 'P1'),
(102, 'P1'),
(103, 'P3');

-- =========================
-- INSERT DATA INTO Ternary Relationship
-- =========================
INSERT INTO Emp_Skills_Used_Projects VALUES
(101, 'SK2', 'P1'),
(102, 'SK1', 'P2'),
(103, 'SK3', 'P3');

-- =========================
-- UPDATE EXAMPLES
-- =========================

UPDATE Projects
SET Proj_Name = 'Shoes Store Website'
WHERE Proj_Id = 'P1';

UPDATE Departs_Locations
SET Dept_Location = 'Fayioum'
WHERE Dept_No = 10
AND Dept_Location = 'Alexandria';

-- =========================
-- SELECT QUERIES
-- =========================

-- 1. List employees with cars
SELECT e.Name,
       c.Model AS 'Car Model',
       c.Plate_No AS 'Plate No'
FROM Employees e
JOIN Cars c
ON e.Car_No = c.Plate_No;

-- 2. Show departments and locations
SELECT d.Depart_Name AS 'Department',
       l.Dept_Location AS 'Location'
FROM Departments d
JOIN Departs_Locations l
ON d.Depart_Code = l.Dept_No;

-- 3. Employees not in HR department
SELECT e.ID AS 'Employee ID',
       e.Name,
       d.Depart_Name AS 'Department'
FROM Employees e
JOIN Departments d
ON e.Dept_Id = d.Depart_Code
WHERE d.Depart_Name <> 'HR';

-- 4. Skills used in each project
SELECT s.Sk_Name AS 'Programming Language',
       p.Proj_Name AS 'Project'
FROM Emp_Skills_Used_Projects skm
JOIN Skills s
ON s.Sk_Id = skm.Skill_Id
JOIN Projects p
ON p.Proj_Id = skm.Proj_Id;

