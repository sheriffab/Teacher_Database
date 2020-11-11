CREATE TABLE GUARDIAN_MESSAGE(
	message_id		INT 	NOT NULL,
	message_details	VARCHAR(50),
	guardian_id		INT		, 
		-- This is needed to notifiy the guardian
		
	FOREIGN KEY (guardian_id) REFERENCES STUDENT_GUARDIAN(guardian_id),
	-- 
	CONSTRAINT PK_GUARDIAN_MESSAGE PRIMARY KEY(message_id, guardian_id)
)
go
	create table Detention
	(detention_id int not null PRIMARY KEY,
	detention_type_code int FOREIGN KEY
		references  Ref_Detention_Type(detention_type_code),
	student_id int FOREIGN KEY
		references Students(student_id),
	guardian_id INT NOT NULL,
		--references STUDENT_GUARDIAN(guardian_id),
	datetime_detention_start datetime null,
	datetime_detention_end datetime null,
	detention_summary varchar(50) null,
	other_detail varchar(50),
	FOREIGN KEY (guardian_id) REFERENCES STUDENT_GUARDIAN(guardian_id),)
go
	create table Ref_Detention_Type
	(detention_type_code int not null PRIMARY KEY,
	detention_type_description varchar(50) not null,)
go
	CREATE TABLE STUDENT_GUARDIAN(
	guardian_id		INT 	NOT NULL,
	student_id      INT     NOT NULL,
	guardian_name		VARCHAR(20),				
	guardian_number		VARCHAR(14),
	PRIMARY KEY(guardian_id),
	FOREIGN KEY (student_id) REFERENCES STUDENTS(student_id),
	)
go
  CREATE TRIGGER DetentionTrigger ON Detention
FOR INSERT
AS
INSERT INTO GUARDIAN_MESSAGE
	(message_id, message_details, guardian_id)
	SELECT
		ABS(CHECKSUM(NewId())) % 1000, 'new message',guardian_id
		FROM inserted
