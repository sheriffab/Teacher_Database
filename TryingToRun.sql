CREATE TABLE EMPLOYEE
( 
    Fname VARCHAR(15)   not null,
    Minit CHAR,
    Lname VARCHAR(15)   not null,
    Ssn CHAR(9)         not null,
    Bdate DATE,
    Address VARCHAR(30), 
    Sex CHAR,
    Salary DECIMAL(10,2), 
    Super_ssn CHAR(9), -- CONSTRAINT is being placed on this key
    Dno INT             not null,
    PRIMARY KEY (Ssn), 
    
    CONSTRAINT EMPPK PRIMARY KEY (Ssn),
    
    -- we call this constraint EMPSUPERFK 
    -- cons
    CONSTRAINT EMPSUPERFK FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn)
        ON DELETE SET NULL on UPDATE CASCADE,
    
    CONSTRAINT EMPDEPTFK FOREIGN KEY(Dno) REFERENCES(Dnumber)
        ON DELETE SET DEFAULT ON UPDATE CASCADE
);

SELECT * FROM [CLASSES] ;

INSERT INTO EMPLOYEE (Fname, Lname, Dno, Ssn) 
    VALUES ('Richard', 'Marin', '4', '653298653');

select * from EMPLOYEE;

CREATE TABLE DEPARTMENT
( 
    Dname VARCHAR(15) not null,
    Dnumber INT       not null,
    Mgr_ssn CHAR(9)   not null,
    Mgr_start_date DATE,
    PRIMARY KEY (Dnumber),
    UNIQUE (Dname),
    -- basically mgr_ssn has to match with a ssn from employees
    -- when inserting data
    FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn) 
    
);

select * from DEPARTMENT;

INSERT INTO DEPARTMENT (Dname, Dnumber, mgr_ssn ) 
    VALUES ('Richard22', '22', '653298653');

select * from DEPARTMENT;