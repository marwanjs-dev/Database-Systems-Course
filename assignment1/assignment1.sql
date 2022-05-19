/*
	1.a: EMP_CODE, STORE_CODE, REGION_CODE are primary key for the three tables
	sys_config1.b: yes, because there are no repeated values in each and every cell in each table
	1.c: yes, because each foreign key column (attribute) in the each table contains existent values in the table 
	1.d: apparantly 1:N between Region:Store and it is mandatory for each region to have one or more stores and it is logically mandatory for each store to be in a region 
    1.F: each store employs many employees and an employee of a store can be an employee of another store however that is not a general case so lets say that each employee 
		 can just work in one store in that case the relationship would be 1:N and it is mandatory that each store should have an employee and it is mandatory that each employee 
		 should work in a store
*/

use Marwan;

CREATE TABLE EMPLOYEE (
    EMP_CODE INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    EMP_TITLE VARCHAR(5) NOT NULL,
    EMP_LNAME CHAR(50) NOT NULL,
    EMP_FNAME CHAR(50) NOT NULL,
    EMP_INTITIAL CHAR(1),
    EMP_DOB DATE NOT NULL,
    STORE_CODE INT NOT NULL
);

CREATE TABLE REGION (
    REGION_CODE INT AUTO_INCREMENT PRIMARY KEY,
    REGION_DESCRIPT CHAR(20)
);

CREATE TABLE STORE (
    STORE_CODE INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    STORE_NAME CHAR(20) NOT NULL,
    STORE_YID_SALES INT NOT NULL,
    REGION_CODE INT NOT NULL,
    EMP_CODE INT NOT NULL,
    FOREIGN KEY (EMP_CODE)
        REFERENCES EMPLOYEE (EMP_CODE),
    FOREIGN KEY (REGION_CODE)
        REFERENCES REGION (REGION_CODE)
);

ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (STORE_CODE) REFERENCES STORE(STORE_CODE);