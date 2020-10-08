/*  
 *  CSC 33600, Fall 2020
 *  Project #2: Classroom Database
 *  
 *  Names: Amadou W Jallow, 
 *
 */


/*
 * Teachers table:
 * Details to include ?  fname, lname, phone #, address, ...... ?
 *
 */
CREATE TABLE Teachers
(
    teacher_id VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number CHAR(10),
    curr_address VARCHAR(100) NOT NULL,
    PRIMARY KEY (teacher_id)
)

GO

/*
 * Students table:
 * Details to include ?
 */
CREATE TABLE Students
(
    student_id VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number CHAR(10),
    academic_standing VARCHAR(50),
    sudent_summary VARCHAR(1000),
    PRIMARY KEY (student_id)
)

GO

/*
 * Student_Loans table:
 * Details to include ?
 */

CREATE TABLE Student_Loans
(
    student_loan_id VARCHAR(20) NOT NULL,
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    loan_type VARCHAR(30) NOT NULL,
    date_of_loan DATE NOT NULL,
    loan_amount FLOAT NOT NULL,
    loan_interest FLOAT NOT NULL,
    loan_agreement_terms VARCHAR(1000) NOT NULL,
    PRIMARY KEY (student_loan_id)
)

GO

/*
 * Transcripts table:
 * Details to include ?
 */

GO

CREATE TABLE Transcripts
(
    transcript_id VARCHAR(20) NOT NULL,
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    transcript_date DATE NOT NULL,
    transcript_type VARCHAR(20) NULL,
    PRIMARY KEY (transcript_id)
)

GO

/*
 * Behaviour_Monitoring table:
 * Details to include ?
 */

CREATE TABLE Behaviour_Monitoring
(
    behaviour_monitoring_id VARCHAR(20) NOT NULL,
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    type_of_monitoring VARCHAR(50) NULL,
    result_summary VARCHAR(200) NULL,
    PRIMARY KEY (behaviour_monitoring_id)
)

GO

/*
 * Address table:
 * Details to include?
 */
CREATE TABLE Addresses
(
    address_id VARCHAR(20) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state_initial VARCHAR(2) NOT NULL,
    zipcode VARCHAR(5) NOT NULL,
    country VARCHAR(40) NOT NULL,
    PRIMARY KEY (address_id)
)

GO

/*
 * Classes table:
 * Details to include ?
 */
CREATE TABLE Classes
(
    class_id VARCHAR(20) NOT NULL,
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    teacher_id VARCHAR(20) NOT NULL
        REFERENCES Teachers(teacher_id),
    class_name VARCHAR(25) NOT NULL,
    pre_req VARCHAR(10) NOT NULL,
    delivery_mode VARCHAR(10) NOT NULL,
    PRIMARY KEY (class_id)
)

GO

/*
 * Ref_Address_types table:
 * Details to include ?
 */
CREATE TABLE Ref_Address_Types
(
    address_type_code VARCHAR(20) NOT NULL,
    address_type_desc VARCHAR(50) NOT NULL,
    PRIMARY KEY (address_type_code)
)

GO

/*
 * Students_Addresses table:
 * Details to include ?
 */
CREATE TABLE Students_Addresses
(
    student_address_id VARCHAR(20) NOT NULL,
    address_id VARCHAR(20) NOT NULL
        REFERENCES Addresses(address_id),
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    address_type_code VARCHAR(20) NOT NULL
        REFERENCES Ref_Address_Types(address_type_code),
    date_from DATE NOT NULL,
    date_to DATE NOT NULL,
    PRIMARY KEY (student_address_id),
)

GO

/*
 * Ref_Event_Types table:
 * Details to include ?
 */

CREATE TABLE Ref_Event_Types
(
    event_type_code VARCHAR(20) NOT NULL,
    event_type_desc VARCHAR(50) NOT NULL,
    PRIMARY KEY (event_type_code)
)

GO

/*
 * Student_Events table:
 * Details to include ?
 */

CREATE TABLE Student_Events
(
    event_id VARCHAR(20) NOT NULL,
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    event_type_code VARCHAR(20) NOT NULL
        REFERENCES Ref_Event_Types(event_type_code),
    event_date DATE NOT NULL,
    event_duaration VARCHAR(10) NULL,
    PRIMARY KEY (event_id)
)

GO

/*
 * Ref_Achievement_Type table:
 * Details to include ?
 */

CREATE TABLE Ref_Achievement_Type
(
    achievement_type_code VARCHAR(20) NOT NULL,
    achievement_type_desc VARCHAR(50) NOT NULL,
    PRIMARY KEY (achievement_type_code)
)

GO

/*
 * Achievements table:
 * Details to include ?
 */

CREATE TABLE Achievements
(
    achievement_id VARCHAR(20) NOT NULL,
    achievement_type_code VARCHAR(20) NOT NULL
        REFERENCES Ref_Achievement_Type(achievement_type_code),
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    archievement_date DATE NOT NULL,
    semester VARCHAR(10) NOT NULL,
    major VARCHAR(30) NULL,
    PRIMARY KEY (achievement_id)
)

GO

/*
 * Ref_Detention_Type table:
 * Details to include ?
 */

CREATE TABLE Ref_Detention_Type
(
    detention_type_code VARCHAR(20) NOT NULL,
    detention_type_desc VARCHAR(50) NOT NULL,
    PRIMARY KEY (detention_type_code)
)

GO

/*
 * Detention table:
 * Details to include ?
 */

CREATE TABLE Detention
(
    detention_id VARCHAR(20) NOT NULL,
    detention_type_code VARCHAR(20) NOT NULL
        REFERENCES Ref_Detention_Type(detention_type_code),
    student_id VARCHAR(20) NOT NULL
        REFERENCES Students(student_id),
    date_of_detention DATE NOT NULL,
    end_of_detention DATE NOT NULL,
    detention_summary VARCHAR(150) NOT NULL,
    behaviour_monitoring_id VARCHAR(20) NOT NULL
        REFERENCES Behaviour_Monitoring(behaviour_monitoring_id),
    PRIMARY KEY (detention_id)
)

--============================================END_OF_TABLES_CREATION========================================================

/*
 * Test by inserting sample data into tables
 */

--insert into Teachers table
INSERT Teachers
VALUES('1223448', 'Kumud', 'Majumder', '2127769999', '160 Convent Ave, New York, NY 10031')

 GO

INSERT Teachers
VALUES('2924428', 'Douglas', 'Troegar', '2128287878', '160 Convent Ave, New York, NY 10031')

 GO

--insert into Students table
INSERT Students
VALUES('28929292', 'Amadou', 'Jallow', '9179998765', 'Good', 'Expected to graduate Fall 2021')

 GO

INSERT Students
VALUES('28232292', 'Christina', 'Barry', '9178887865', 'Good', 'Expected to graduate Fall 2022')

 GO

--insert into Student_Loan table
INSERT Student_Loans
VALUES('893893', '28929292', 'subsidized', '10/01/2019', $5000, $2, 'Must be enrolled in college to defer payment')

GO

INSERT Student_Loans
VALUES('820202', '28232292', 'unsubsidized', '11/23/2018', $8000, $5, 'Must be enrolled in college to defer payment')

GO

--insert into Transcripts table
INSERT Transcripts
VALUES('289292', '28929292', '10/01/2020', 'unofficial')

GO

INSERT Transcripts
VALUES('278287', '28232292', '10/01/2021', 'official')

GO

--insert into Behaviour_Monitoring table
INSERT Behaviour_Monitoring
VALUES('289289', '28929292', 'online', 'Positive behaviour')

GO

INSERT Behaviour_Monitoring
VALUES('893939', '28232292', 'in-person', 'Good behaviour')

GO

--insert into Addresses table
INSERT Addresses
VALUES('892112', '3000 Manhattan Ave', 'NYC', 'NY', '10019', 'USA')

GO

INSERT Addresses
VALUES('292929', '2000 Covenant Ave', 'Bronx', 'NY', '10008', 'USA')

GO

--insert into Classes table
INSERT Classes
VALUES('82322', '28929292', '1223448', 'CSC-33600', 'CSC-22000', 'Online')

GO

INSERT Classes
VALUES('89892', '28232292', '2924428', 'CSC-30100', 'CSC-10400', 'Hybrid')

GO


--insert into Ref_Address_Types table
INSERT Ref_Address_Types
VALUES('2892892', 'Home')

GO

INSERT Ref_Address_Types
VALUES('298892', 'College')

GO

--insert into Students_Addresses table
INSERT Students_Addresses
VALUES('829202', '892112', '28929292', '2892892', '10/05/2018', '10/06/2023')

GO

INSERT Students_Addresses
VALUES('820283', '292929', '28232292', '298892', '11/02/2017', '09/06/2022')

GO

--insert into Ref_Event_Types table
INSERT Ref_Event_Types
VALUES('89893', 'Exams')

GO

INSERT Ref_Event_Types
VALUES('29029', 'Registration')

GO

--insert into Student_Events table
INSERT Student_Events
VALUES('90289190', '28929292', '89893', '10/05/2018', '2hr')

GO

INSERT Student_Events
VALUES('29029090', '28232292', '29029', '11/02/2017', '1hr')

GO

--insert into Ref_Achievement_Type table
INSERT Ref_Achievement_Type
VALUES('899823', 'Academic')

GO

INSERT Ref_Achievement_Type
VALUES('389920', 'Athetic')

GO

--insert into Achievements table
INSERT Achievements
VALUES('898929', '899823', '28929292', '10/05/2018', 'Spring', 'Computer Science')

GO

INSERT Achievements
VALUES('2908928', '389920', '28232292', '11/02/2017', 'Fall', 'Electrical Engineering')

GO

--insert into Ref_Detention_Type table
INSERT Ref_Detention_Type
VALUES('899922', 'After School')

GO

INSERT Ref_Detention_Type
VALUES('902902', 'Break')

GO

--insert into Detention table
INSERT Detention
VALUES('89289892', '899922', '28929292', '10/05/2018', '10/05/2018', 'Student taking part in after school program', '289289')

GO

INSERT Detention
VALUES('28929922', '902902', '28232292', '11/02/2017', '10/05/2018', 'Student taking to participate in soccer practice', '893939')

GO

--============================================END_OF_TABLES_CREATION========================================================


/*
 * Print detail info about classroom database
 */

SELECT *
FROM Sys.Tables

GO


/*
 * Print individual tables
 */
SELECT *
FROM [Classroom].[dbo].[Teachers]

GO

SELECT *
FROM [Classroom].[dbo].[Students]

GO

SELECT *
FROM [Classroom].[dbo].[Student_Loans]

GO

SELECT *
FROM [Classroom].[dbo].[Transcripts]

GO

SELECT *
FROM [Classroom].[dbo].[Behaviour_Monitoring]

GO

SELECT *
FROM [Classroom].[dbo].[Addresses]

GO

SELECT *
FROM [Classroom].[dbo].[Classes]

GO

SELECT *
FROM [Classroom].[dbo].[Ref_Address_Types]

GO

SELECT *
FROM [Classroom].[dbo].[Students_Addresses]

GO

SELECT *
FROM [Classroom].[dbo].[Ref_Event_Types]

GO

SELECT *
FROM [Classroom].[dbo].[Student_Events]

GO

SELECT *
FROM [Classroom].[dbo].[Ref_Achievement_Type]

GO

SELECT *
FROM [Classroom].[dbo].[Achievements]

GO

SELECT *
FROM [Classroom].[dbo].[Ref_Detention_Type]

GO

SELECT *
FROM [Classroom].[dbo].[Detention]
