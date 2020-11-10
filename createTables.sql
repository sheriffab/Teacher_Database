-- CREATE DATABASE CLASSROOM;
-- GO

-- jason

CREATE TABLE TEACHER(
    teacher_id      INT             NOT NULL,
    Fname           VARCHAR(20)     ,
    Lname           VARCHAR(20)     ,

    PRIMARY KEY (teacher_id)    
)

-- teacher has a 1-N relationship with class
CREATE TABLE CLASS(
    class_id        INT             NOT NULL,
    teacher_id      INT             ,
    class_name      VARCHAR(20)     ,

    FOREIGN KEY(teacher_id) REFERENCES TEACHER(teacher_id),
    PRIMARY KEY (class_id)
)



CREATE TABLE STUDENT(
    student_id      INT             NOT NULL,
    std_Fname       VARCHAR(20)     ,
    std_Lname       VARCHAR(20)     ,

    PRIMARY KEY(student_id)
    -- might be having a lot of foreign keys 
)

-- M:N relationship between students and class
    -- i think this requires another attribute aside from the primary keys
create TABLE ENROLLED (
    student_id      INT             NOT NULL,
    class_id        INT             NOT NULL,

    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (class_id) REFERENCES CLASS(class_id),

    CONSTRAINT PK_enrolled PRIMARY KEY (student_id, class_id)
        
)

-- anthony
-- establishes 1:1 relationship b/w student and transcript
	create table Transcripts
	(transaction_id int not null PRIMARY KEY,
	 student_id int FOREIGN KEY
		references Student(student_id) not null,
	date_of_transcript datetime not null,
	transaction_details varchar(50) null)
go
-- establishes 1:1 b/w student and behaviour monitoring
	create table Behavior_Monitoring
	(behavior_monitoring_id int not null PRIMARY KEY,
	 student_id int FOREIGN KEY	
		references Student(student_id) not null,
	behav_monitoring_details varchar(50) null)
go

	create table Ref_Detention_Type
	(detention_type_code int not null PRIMARY KEY,
	detention_type_description varchar(50) not null,)
go
-- establishes 1:N for student and detention
	create table Detention
	(detention_id int not null PRIMARY KEY,
	detention_type_code int FOREIGN KEY
		references  Ref_Detention_Type(detention_type_code),
	student_id int FOREIGN KEY
		references Student(student_id),
	datetime_detention_start datetime null,
	datetime_detention_end datetime null,
	detention_summary varchar(50) null,
	other_detail varchar(50))
go



CREATE TABLE GUARDIAN (
	guardian_id			INT 			NOT NULL,
	guardian_name		VARCHAR(20)				,
	guardian_number		VARCHAR(14),
	-- message_id			INT, 
		-- establishes 1 message for 2 or more gaurdians

	-- FOREIGN KEY (message_id) REFERENCES GUARDIAN_MESSAGE(message_id),
	PRIMARY KEY(guardian_id)
)

	-- M:N relation
CREATE TABLE GUARDIAN_MESSAGE(
	message_id		INT 	NOT NULL,
	message_details	VARCHAR(50),
	guardian_id		INT		, 
		-- This is needed to notifiy the guardian
		
	FOREIGN KEY (guardian_id) REFERENCES GUARDIAN(guardian_id),
	-- 
	CONSTRAINT PK_GUARDIAN_MESSAGE PRIMARY KEY(message_id, guardian_id)
)

-- M:N Relationship
-- student can have 2 guardians 
-- guardian can have various students 
CREATE TABLE STUDENT_GUARDIAN(
	guardian_id		INT 	NOT NULL,
	student_id      INT     NOT NULL,

	FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
	FOREIGN KEY(guardian_id) REFERENCES GUARDIAN(guardian_id),

	CONSTRAINT PK_STUDENT_GUARDIAN PRIMARY KEY (guardian_id, student_id)
)


