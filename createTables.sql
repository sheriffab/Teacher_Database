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
	create table Transcripts
	(transaction_id int not null PRIMARY KEY,
	 student_id int FOREIGN KEY
		references Students(student_id) not null,
	sate_of_transcript datetime not null,
	transaction_details varchar(50) null)
go
	create table Behavior_Monitoring
	(behavior_monitoring_id int not null PRIMARY KEY,
	 student_id int FOREIGN KEY	
		references Students(student_id) not null,
	behav_monitoring_details varchar(50) null)
go
	create table Ref_Detention_Type
	(detention_type_code int not null PRIMARY KEY,
	detention_type_description varchar(50) not null,)
go
	create table Detention
	(detention_id int not null PRIMARY KEY,
	detention_type_code int FOREIGN KEY
		references  Ref_Detention_Type(detention_type_code),
	student_id int FOREIGN KEY
		references Students(student_id),
	datetime_detention_start datetime null,
	datetime_detention_end datetime null,
	detention_summary varchar(50) null,
	other_detail varchar(50))
go
