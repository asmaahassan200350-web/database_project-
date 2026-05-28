-- Creating tables 

=========================
-- Car Table Creation
=========================
CREATE TABLE Cars
(	
Plate_No VARCHAR (10) ,
Model VARCHAR (15) ,
Color VARCHAR (10) ,
CONSTRAINT Car_PK PRIMARY KEY (Plate_No)
);

 =========================
-- Employees Table Creation
 =========================
CREATE TABLE Employees
(
	ID INT NOT NULL ,
    SSN INT ,
    Name VARCHAR (20) , 
    Salary DECIMAL (10,2)	DEFAULT 5000 ,
    Cont_Id VARCHAR (10)  NOT NULL UNIQUE ,
    Cont_Type VARCHAR (10) 	 NOT NULL ,
    Cont_St_Date DATE	NOT NULL ,
    Dept_Id INT ,
    Date_Of_Birth DATE ,
    Street VARCHAR (10) ,
    Zone VARCHAR(10),
    Car_No VARCHAR (10),
    
    CONSTRAINT Emp_PK PRIMARY KEY (SSN),
	
	CONSTRAINT Sal_Chk CHECK (Salary BETWEEN 5000	AND	25000),
	
    CONSTRAINT Emp_Car_FK FOREIGN KEY (Car_No) REFERENCES Cars (Plate_No) ,
	
    CONSTRAINT Emp_Dept_FK FOREIGN KEY (Dept_Id) REFERENCES Departments (Depart_Code)
);

-- =========================
-- Departments Table Creation
 =========================

CREATE TABLE Departments
(
	Depart_Code INT ,
    Depart_Name VARCHAR (20)  NOT NULL UNIQUE,
    Manager_SSN INT ,
    
    CONSTRAINT Depart_PK PRIMARY KEY (Depart_Code)
);

 =========================

-- Add relationship attribute to departments table
 =========================

ALTER TABLE Departments
ADD St_Date DATE NOT NULL ;
 =========================
 
-- Emp_Phones Table Creation

CREATE TABLE Emp_Phones
(
	Phone_No VARCHAR (18) ,
    Ph_SSN INT ,
    
    CONSTRAINT Pho_No_PK PRIMARY KEY (Phone_No , Ph_SSN),
    CONSTRAINT Pho_Emp_FK FOREIGN KEY (Ph_SSN) REFERENCES Employees (SSN)
);
 =========================

-- Departs_Locations Table Creation

CREATE TABLE Departs_Locations
(
	Dept_No INT ,
    Dept_Location VARCHAR (100) , 
    
    CONSTRAINT Loca_PK PRIMARY KEY (Dept_No,Dept_Location) ,
    CONSTRAINT Loca_Dept_FK FOREIGN KEY (Dept_No) REFERENCES Departments (Depart_Code)
);

 =========================

-- Depandants Table Creation

CREATE TABLE Dependants
(
	Name VARCHAR (20) ,
    Depend_Id INT ,
    
    CONSTRAINT Depend_PK PRIMARY KEY  (Name , Depend_ID) ,
    CONSTRAINT Depend_FK FOREIGN KEY (Depend_Id) REFERENCES Employees (SSN)
);

 =========================

-- Skills Table Creation

CREATE TABLE Skills
(
	Sk_Id VARCHAR (10) ,
    Sk_Name VARCHAR (15) NOT NULL ,
    
    CONSTRAINT SK_PK PRIMARY KEY (Sk_Id)
);

 =========================

-- Projects Table Creation

CREATE TABLE Projects
(
	Proj_Id VARCHAR (10) , 
    Proj_Name VARCHAR (25) NOT NULL ,
    
    CONSTRAINT PROJ_PK PRIMARY KEY (Proj_Id)
);

 =========================


-- Projects_Emp Table Creation

CREATE TABLE Employees_Projects
(
	Emp_No INT ,
    Proj_REF VARCHAR(10),
    
    CONSTRAINT EMP_PROJS_PK PRIMARY KEY (Emp_No , Proj_REF)
);

 =========================

-- Emp_Skills_Project Table for ( Tertiary M:N Relationship between the 3 Entities )

CREATE  TABLE Emp_Skills_Used_Projects
(
	Emp_Id INT ,
    Skill_Id VARCHAR (10)	,
	Proj_Id	VARCHAR(10)	,
    
    CONSTRAINT EMP_SK_PROJ_PK PRIMARY KEY (Emp_Id,Skill_Id , Proj_Id ) ,
    CONSTRAINT Emp_Sk_PROJ_FK FOREIGN KEY (Emp_Id) REFERENCES Employees (SSN) ,
    CONSTRAINT Sk_Emp_PROJ_FK FOREIGN KEY (Skill_Id) REFERENCES Skills (Sk_Id) ,
    CONSTRAINT PROJ_Emp_Sk_FK FOREIGN KEY (Proj_Id) REFERENCES Projects (Proj_Id) 
);

 =========================

-- INSERTION OF DATA IN TABLES 
-- INSERT Data In Cars Table

INSERT INTO Cars VALUES ('ABC123', 'Toyota Corolla', 'Blue');
INSERT INTO Cars VALUES ('XYZ789', 'Honda Civic', 'Red');
INSERT INTO Cars VALUES ('LMN456', 'Ford Focus', 'Black');
 =========================

-- INSERT Data in Departments Table

INSERT INTO Departments VALUES (10, 'HR', 101, '2020-01-01');
INSERT INTO Departments VALUES (20, 'IT', 102, '2019-05-15');
INSERT INTO Departments VALUES (30, 'Finance', 103, '2021-09-10');
 =========================

-- INSERT Data in Employees Table
INSERT INTO Employees 
VALUES (1, 101, 'Ali Hassan', 7000, 'C001', 'FullTime', '2022-01-01', 10, '1990-05-15', 'Main St', 'ZoneA', 'ABC123');

INSERT INTO Employees 
VALUES (2, 102, 'Sara Ahmed', 9000, 'C002', 'PartTime', '2023-03-01', 20, '1988-07-20', 'Elm St', 'ZoneB', 'XYZ789');

INSERT INTO Employees 
VALUES (3, 103, 'Omar Youssef', 12000, 'C003', 'Contract', '2021-06-15', 10, '1995-11-10', 'Pine St', 'ZoneC', 'LMN456');

INSERT INTO Employees 
VALUES (4, 104, 'Ahmed Hany', 24999, 'C004', 'Contract', '2021-01-15', 10, '2000-05-10', 'Luxor St', 'Sporting',NULL );
 =========================

-- INSERT Data in Emp_Phones Table

INSERT INTO Emp_Phones VALUES ('01012345678', 101);
INSERT INTO Emp_Phones VALUES ('01198765432', 102);
INSERT INTO Emp_Phones VALUES ('01234567890', 103);
 =========================

-- INSERT Data into Departs_Locations Table 

INSERT INTO Departs_Locations VALUES (10, 'Alexandria');
INSERT INTO Departs_Locations VALUES (20, 'Cairo');
INSERT INTO Departs_Locations VALUES (30, 'Giza');
INSERT INTO Departs_Locations VALUES (30, 'Aswan');
INSERT INTO Departs_Locations VALUES (20, 'Alexandria');
INSERT INTO Departs_Locations VALUES (10, 'Cairo');
 =========================

-- INSERT Data into Dependants Table 

INSERT INTO Dependants VALUES ('Mona', 101);
INSERT INTO Dependants VALUES ('Khaled', 101);
INSERT INTO Dependants VALUES ('Nour', 103);
 =========================

-- INSERT Data into Skills Table 

INSERT INTO Skills VALUES ('SK1', 'Java');
INSERT INTO Skills VALUES ('SK2', 'SQL');
INSERT INTO Skills VALUES ('SK3', 'Python');
 =========================

-- INSERT Data into Projects Table 

INSERT INTO Projects VALUES ('P1', 'Payroll System');
INSERT INTO Projects VALUES ('P2', 'E-Commerce Website');
INSERT INTO Projects VALUES ('P3', 'Mobile Banking App');
 =========================

-- INSERT Data into Employees_Projects Table 
INSERT INTO Employees_Projects VALUES (101, 'P1');
INSERT INTO Employees_Projects VALUES (102, 'P1');
INSERT INTO Employees_Projects VALUES (103, 'P3');
 =========================

-- INSERT Data into Emp_Skills_Used_Projects Table

INSERT INTO Emp_Skills_Used_Projects VALUES (101, 'SK2', 'P1');
INSERT INTO Emp_Skills_Used_Projects VALUES (102, 'SK1', 'P2');
INSERT INTO Emp_Skills_Used_Projects VALUES (103, 'SK3', 'P3');

 =========================


-- Change one column value
UPDATE projects
SET Proj_Name ='Shoes Store Website' WHERE Proj_Id = 'P1';

SET Dept_Location = 'Fayioum' WHERE Dept_No = 10 AND Dept_Location = "Alexandria";

-- =========================
-- SELECT QUERIES
-- =========================

-- 1-Now , List all employees's names that have cars only

SELECT Name , c.Model AS "Car Model" , c.Plate_No AS "Plate No" FROM Employees e JOIN cars c ON e.Car_No = c.Plate_No ;

=========================

-- 2 - Show each department and its Location

-- Firstly chech departs_locations table 
SELECT * FROM departs_locations;

-- Now , Show each department and its Locaion

SELECT d.Depart_Name AS "Department" , l.Dept_Location AS "Location" FROM departments d  JOIN departs_locations l ON d.Depart_Code = l.Dept_No ;

=========================
-- 3- Find Employees that is not in department HR
-- First check the tables to fetch the result first
SELECT * FROM Employees ;
SELECT * FROM departments ;

-- Now , Find Employees that are not in 'HR' Department
SELECT e.ID AS " Employee ID " , e.Name , d.Depart_Name AS "Department" FROM employees e JOIN departments d ON e.Dept_Id = d.Depart_Code 
WHERE NOT d.Depart_Name = "HR" ;

=========================

-- 4- List Skill name used in each project 
SELECT s.sk_name AS "Progamming Language" , p.proj_name AS " Project " FROM emp_skills_used_projects skm JOIN skills s ON s.Sk_Id = skm.Skill_Id 
JOIN projects p ON p.Proj_Id = skm.Proj_Id ;
