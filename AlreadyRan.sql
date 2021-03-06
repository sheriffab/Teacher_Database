-- CREATE DATABASE CLASSROOM;
-- GO

CREATE TABLE TEACHER_DETAILS
(
    Fname           VARCHAR(15)     NOT NULL, 
    Lname           VARCHAR(15)     NOT NULL, -- maxLimit of 15
    Salary          DECIMAL(10,2)   NOT NULL,
    -- CONSTRAINT PK_details PRIMARY KEY ( [Fname],[Lname],[Salary] )
    PRIMARY KEY (Fname, Lname, Salary)
);
-- Primary key is ouputted as one?

INSERT INTO TEACHER_DETAILS
( -- Columns to insert data into
 [Fname], [Lname], [Salary]
)
VALUES
( -- First row: values for the columns in the list above
 'Name3', 'LastName3', '60000'
);
-- Add more rows here
GO

SELECT * FROM [TEACHER_DETAILS] ;

CREATE TABLE TEACHERS
(
    Teacher_id      INT                NOT NULL,
    Teacher_name        VARCHAR(15)    NOT NULL,
    Teacher_lastName    VARCHAR(15)    NOT NULL,
    Teacher_salary      DECIMAL(10,2)  NOT NULL,
    -- basically in order to create a teacher profile it
        -- has to match up with a section inside teacher_details
    FOREIGN KEY (Teacher_name, Teacher_lastName, Teacher_salary) 
        REFERENCES Teacher_details(Fname, Lname, Salary),

    PRIMARY KEY (Teacher_id)
);
GO

-- ERROR: The INSERT statement conflicted with the FOREIGN KEY constraint "FK__TEACHERS__5EBF139D".
INSERT INTO TEACHERS
( -- Columns to insert data into
 [Teacher_id] , [Teacher_name] , [Teacher_lastName], [Teacher_salary]
)
VALUES
( -- First row: values for the columns in the list above
 '003' , 'Name2', 'LastName2', '60000'
);

SELECT * FROM [TEACHERS] ;

-- Add more rows here
GO










-- ALTER TABLE TEACHER_DETAILS add CONSTRAINT details UNIQUE ([Fname],[Lname],[Salary]);
-- GO

-- ALTER TABLE TEACHER_DETAILS add CONSTRAINT PK_details PRIMARY KEY ( [Fname],[Lname],[Salary] ) ;
-- GO -- didnt execute primary key is already defined

-- 1
-- TRUNCATE TABLE teacher_details;

-- ALTER TABLE TEACHER_DETAILS DROP  PRIMARY KEY ;

-- ALTER TABLE TEACHER_DETAILS DROP CONSTRAINT details; -- havent executed

-- ALTER TABLE teacher_details ADD PRIMARY KEY ( Fname) ; 
-- GO

-- ALTER TABLE TEACHER_DETAILS DROP constraint Fname, Lname, Salary; -- constraints dont exist



-- -- Delete rows from table '[teacher_details]' in schema '[dbo]'
-- DELETE FROM [dbo].[teacher_details]
-- GO