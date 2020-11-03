	create table Ref_Achievement_Type
	(achievement_type_code char(4) not null,
	achievement_type_description varchar(20),
	primary key(achievement_type_code))
go
	create table Achievements
	(achievement_id char(5) not null,
	achievement_type_code char(4) not null,
	student_id int not null,
	date_achievement date null,
	achievement_details varchar(200) null,
	other_detail varchar(200) null
	primary key(achievement_id)
	foreign key(achievement_type_code) references Ref_Achievement_Type(achievement_type_code),
	foreign key(student_id) references Students(student_id))
go
	create table Ref_Event_Types
	(event_type_code char(10)             not null,
	event_type_description varchar(100) not null,
	primary key(event_type_code))
go
	create table Student_events
	(event_id int not null,
	event_type_code char(10) not null,
	student_id int not null,
	event_date date not null,
	other_details varchar(200) null
	primary key(event_id)
	foreign key(event_type_code) references Ref_Event_Types(event_type_code),
	foreign key(student_id) references Students(student_id))
go

	create table Addresses
	(address_id int not null,
	address_details varchar(200) not null
	primary key(address_id))
go 
	create table Student_addresses
	(student_addresses_id int not null,
	address_id int not null,
	address_type_code char(10) not null,
	student_id int not null,
	date_from date,
	date_to date,
	primary key(student_addresses_id),
	foreign key(address_id) references Addresses(address_id),
	foreign key(address_type_code) references Ref_Address_Types(address_type_code),
	foreign key(student_id) references  Students(student_id))
go 
	create table Ref_Address_Types(
	address_type_code char(10) not null,
	address_type_description varchar(15) not null,
	primary key(address_type_code))
go
	create table Students(
	student_id int not null,
	student_fname varchar(15) not null,
	student_lname varchar(15) not null,
	student_ssn int not null,
	student_dob date not null,
	student_grade_lvl char(5),
	primary key(student_id))















