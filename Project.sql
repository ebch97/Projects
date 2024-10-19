-- Project name: Training programme Management Database

-- Project idea/summary: This database will be based on the work that I do for my daytime job, which is to do with project management for an education charity.
-- In this project I intend to create a database that will resemble large scale projects that we manage at the charity I work at
-- This will be a database of training courses commissioned as part of the programme, and will include data such as delegate lists (with made up data)
-- The db is intended to make project management easier, in a similar way that a CRM like salesforce works, but this will be better at instantly retrieving small bits of data

Create database mole_programme;
use mole_programme;

-- TABLE 1
create table mole_programme_courses (course_name VARCHAR(100) NOT NULL, course_id VARCHAR(20) NOT NULL PRIMARY KEY, impact_project_code VARCHAR(10), course_start_date DATE NOT NULL, cohort INTEGER, course_venue CHAR(10), course_capacity INTEGER (2) NOT NULL, course_delegate_numbers INTEGER (2) NOT NULL);

INSERT INTO mole_programme_courses
(course_name,course_id,impact_project_code,course_start_date,cohort,course_venue,course_capacity,course_delegate_numbers)
VALUES('Neuroscience','Neuro021030','REA01', '2030-10-01',1,'online',10,8),
('Pedagogy','Pedagog141030','REA01','2030-10-14',1,'hub',10,9),
('Mental_Health','MHealth250131','REA01','2031-01-25',1,'online',50,3),
('Time_Management','TimeM030331','REA01','2031-03-03',2,'online',10,1),
('Time_Management','TimeM160331','REA02','2031-03-16',2,'library',10,8),
('Neuroscience','Neuro010531','REA03','2031-05-01',3,'hub',10,7),
('Mental_Health','MHealth060531','REA04','2031-05-06',3,'hub',50,2),
('Mental_Health','MHealth080531','REA06','2031-05-08',3,'online',50,5),
('Pedagogy','Pedagog210731','REA05','2031-07-21',4,'library',10,5),
('Neuroscience','Neuro011131','REA03','2031-11-01',5,'online',10,4),
('Neuroscience','Neuro030332','REA03','2032-03-03',6,'online',10,4),
('Time_Management','TimeM230332','REA02','2032-03-23',6,'library',10,3),
('Mental_Health','MHealth260332','REA04','2032-03-26',6,'library',50,5),
('Mental_Health','MHealth300332','REA04','2032-03-30',6,'online',50,1),
('Pedagogy','Pedagog010432','REA05','2032-04-01',7,'hub',10,4),
('Neuroscience','Neuro170532','REA03','2032-05-17',7,'library',10,4),
('Neuroscience','Neuro070632','REA03','2032-06-07',8,'online',10,2),
('Pedagogy','Pedagog160632','REA06','2032-06-16',8,'library',10,1),
('Time_Management','TimeM010732','REA02','2032-07-01',8,'hub',10,0),
('Mental_Health','MHealth100732','REA04','2032-07-10',8,'online',50,3);

select*from mole_programme_courses;

-- TABLE 2
create table mole_programme_impact_evaluation_projects (project_name VARCHAR(50), impact_project_code VARCHAR(10) PRIMARY KEY, project_owner CHAR (50), project_status VARCHAR(20), project_insights VARCHAR(20));

insert into mole_programme_impact_evaluation_projects (project_name, impact_project_code, project_owner, project_status, project_insights)
values ('ALL_COURSES','REA01','MOLECC','Completed','Positive'),
('Time_Management_Impact','REA02','MOLECC','In_Progress','Negative'),
('Neuroscience_Impact','REA03','MOLECC','In_Progress','Positive'),
('Mental_Health_Impact','REA04','External','Not_Started','N/a'),
('Pedagogy_Impact','REA05','External','Not_Started','N/a'),
('PEDMHEALTH_Impact','REA06','External','Not_Started','N/a');

alter table mole_programme_impact_evaluation_projects add column insight_id int(2) not null;
update mole_programme_impact_evaluation_projects set insight_id = 1 where impact_project_code = 'REA01';
update mole_programme_impact_evaluation_projects set insight_id = 2 where impact_project_code = 'REA02';
update mole_programme_impact_evaluation_projects set insight_id = 3 where impact_project_code = 'REA03';
update mole_programme_impact_evaluation_projects set insight_id = 4 where impact_project_code = 'REA04';
update mole_programme_impact_evaluation_projects set insight_id = 5 where impact_project_code = 'REA05';
update mole_programme_impact_evaluation_projects set insight_id = 6 where impact_project_code = 'REA06';

select*from mole_programme_impact_evaluation_projects;

-- TABLE 3
create table Course_Lists (course_id VARCHAR (50) NOT NULL, delegate_name CHAR(50) NOT NULL PRIMARY KEY, delegate_organisation VARCHAR(50) NOT NULL, project_status CHAR(20));
alter table course_lists drop primary key;
alter table course_lists add column list_id integer not null primary key;

INSERT INTO COURSE_LISTS VALUES
('Neuro021030','Sarah','Mole_Park','Attending',1),
('Neuro021030','Frank','Mole_Grove','Attending',2),
('Neuro021030','Matilda','Mole_Grove','Attending',3),
('Neuro021030','Pheobe','Mole_Station','Attending',4),
('Neuro021030','Ben','Mole_Abbey','Attending',5),
('Neuro021030','Wren','Mole_Abbey','Attending',6),
('Neuro021030','Abby','Mole_Park','Attending',7),
('Neuro021030','Pam','Mole_Green','Attending',8),
('Pedagog141030','Sarah','Mole_Park','Attending',9),
('Pedagog141030','Frank','Mole_Grove','Attending',10),
('Pedagog141030','Matilda','Mole_Grove','Attending',11),
('Pedagog141030','Pheobe','Mole_Station','Attending',12),
('Pedagog141030','Ben','Mole_Abbey','Attending',13),
('Pedagog141030','Wren','Mole_Abbey','Attending',14),
('Pedagog141030','Abby','Mole_Park','Attending',15),
('Pedagog141030','Pam','Mole_Green','Attending',16),
('Pedagog141030','Sue','Mole_Green','Attending',17),
('MHealth250131','Sarah','Mole_Park','Attending',18),
('MHealth250131','Frank','Mole_Grove','Attending',19),
('MHealth250131','Matilda','Mole_Grove','Attending',20),
('TimeM030331','Sarah','Mole_Park','Attending',21),
('TimeM160331','Sarah','Mole_Park','Attending',22),
('TimeM160331','Frank','Mole_Grove','Attending',23),
('TimeM160331','Matilda','Mole_Grove','Attending',24),
('TimeM160331','Pheobe','Mole_Station','Attending',25),
('TimeM160331','Ben','Mole_Abbey','Attending',26),
('TimeM160331','Wren','Mole_Abbey','Attending',27),
('TimeM160331','Abby','Mole_Park','Attending',28),
('TimeM160331','Pam','Mole_Green','Attending',29),
('Neuro010531','Sarah','Mole_Park','Attending',30),
('Neuro010531','Frank','Mole_Grove','Attending',31),
('Neuro010531','Matilda','Mole_Grove','Attending',32),
('Neuro010531','Pheobe','Mole_Station','Attending',33),
('Neuro010531','Ben','Mole_Abbey','Attending',34),
('Neuro010531','Wren','Mole_Abbey','Attending',35),
('Neuro010531','Abby','Mole_Park','Attending',36),
('MHealth060531','Sarah','Mole_Park','Attending',37),
('MHealth060531','Frank','Mole_Grove','Attending',38),
('MHealth080531','Sarah','Mole_Park','Attending',39),
('MHealth080531','Frank','Mole_Grove','Attending',40),
('MHealth080531','Matilda','Mole_Grove','Attending',41),
('MHealth080531','Pheobe','Mole_Station','Attending',42),
('MHealth080531','Ben','Mole_Abbey','Attending',43),
('Pedagog210731','Sarah','Mole_Park','Attending',44),
('Pedagog210731','Frank','Mole_Grove','Attending',45),
('Pedagog210731','Matilda','Mole_Grove','Attending',46),
('Pedagog210731','Pheobe','Mole_Station','Attending',47),
('Pedagog210731','Ben','Mole_Abbey','Attending',48),
('Neuro011131','Sarah','Mole_Park','Attending',49),
('Neuro011131','Frank','Mole_Grove','Attending',50),
('Neuro011131','Matilda','Mole_Grove','Attending',51),
('Neuro011131','Pheobe','Mole_Station','Attending',52),
('Neuro030332','Sarah','Mole_Park','Attending',53),
('Neuro030332','Frank','Mole_Grove','Attending',54),
('Neuro030332','Matilda','Mole_Grove','Attending',55),
('Neuro030332','Pheobe','Mole_Station','Attending',56),
('TimeM230332','Sarah','Mole_Park','Attending',57),
('TimeM230332','Frank','Mole_Grove','Attending',58),
('TimeM230332','Matilda','Mole_Grove','Attending',59),
('MHealth260332','Sarah','Mole_Park','Attending',60),
('MHealth260332','Frank','Mole_Grove','Attending',61),
('MHealth260332','Matilda','Mole_Grove','Attending',62),
('MHealth260332','Pheobe','Mole_Station','Attending',63),
('MHealth260332','Ben','Mole_Abbey','Attending',64),
('MHealth300332','Sarah','Mole_Park','Attending',65),
('Pedagog010432','Sarah','Mole_Park','Attending',66),
('Pedagog010432','Frank','Mole_Grove','Attending',67),
('Pedagog010432','Matilda','Mole_Grove','Attending',68),
('Pedagog010432','Pheobe','Mole_Station','Attending',69),
('Neuro170532','Sarah','Mole_Park','Attending',70),
('Neuro170532','Frank','Mole_Grove','Attending',71),
('Neuro170532','Matilda','Mole_Grove','Attending',72),
('Neuro170532','Pheobe','Mole_Station','Attending',73),
('Neuro070632','Sarah','Mole_Park','Attending',74),
('Neuro070632','Frank','Mole_Grove','Attending',75),
('Pedagog160632','Sarah','Mole_Park','Attending',76),
('MHealth100732','Sarah','Mole_Park','Attending',77),
('MHealth100732','Frank','Mole_Grove','Attending',78),
('MHealth100732','Matilda','Mole_Grove','Attending',79);

select* from course_lists;

-- TABLE 4
create table Organisation_courses (delegate_organisation VARCHAR(20) NOT NULL PRIMARY KEY, COURSE_ID VARCHAR(50) NOT NULL, IMPACT_pROJECT_CODE VARCHAR(10) NOT NULL);
alter table organisation_courses drop course_id;
alter table organisation_courses drop impact_project_code;
alter table organisation_courses add IMPACT_PROJECT_CODE VARCHAR(100) NOT NULL;

INSERT INTO Organisation_courses (delegate_organisation, impact_project_code) 
VALUES ('Mole_Park','REA01, REA02, REA03, REA04, REA05, REA06'),
('Mole_Grove', 'REA01, REA02, REA03, REA04,REA05,REA06'),
('Mole_Station', 'REA01,REA02,REA03, REA04,REA05,REA06'),
('Mole_Abbey', 'REA01,REA02,REA03,REA04,REA05,REA06'),
('Mole_Green', 'REA01,REA02');

select* from organisation_courses;

-- TABLE 5
create table Impact_insights (impact_id int(2) primary key, impact_project_code varchar(10) not null, delegate_organisation varchar(20) not null, project_status varchar(20), beneficiaries int(2) not null, improved_pupil_attendance varchar(10), avg_school_attendance_pre int(3), avg_school_attendance_post varchar(20));

insert into impact_insights (impact_id, impact_project_code, delegate_organisation, project_status, beneficiaries, improved_pupil_attendance, Avg_school_attendance_pre, Avg_school_attendance_post)
values (1,'REA01','Mole_Park','Engaged',55,'Yes',76,81),
(2,'REA02','Mole_Park','Engaged',34,'Yes',87,88),
(3,'REA03','Mole_Park','Engaged',54,'No',54,56),
(4,'REA04','Mole_Park','Not_Started',87,'N/a',76,'n/a'),
(5,'REA05','Mole_Park','Not_Started',233,'N/a',56,'n/a'),
(6,'REA06','Mole_Park','Not_Started',28,'N/a',86,'n/a');

select* from impact_insights;

-- adding foreign keys after creating all tables to link them together
alter table mole_programme_courses add constraint fk_impact_id foreign key (impact_project_code) references mole_programme_impact_evaluation_projects (impact_project_code) ;
alter table mole_programme_impact_evaluation_projects add constraint fk_insight_id foreign key (insight_id) references impact_insights (impact_id) ;
alter table COURSE_LISTS add constraint fk_course_id foreign key (course_id) references mole_programme_courses (course_id) ;
alter table COURSE_LISTS add constraint fk_delegate_organisation foreign key (delegate_organisation) references organisation_courses (delegate_organisation) ;
alter table impact_insights add constraint fk_impact_project_code foreign key (impact_project_code) references mole_programme_impact_evaluation_projects (impact_project_code) ;

-- Joining table 1 and 3

select m.course_id, m.course_name, c.delegate_organisation, c.delegate_name from mole_programme_courses m left join course_lists c on m.course_id = c.course_id;

-- create stored function

DELIMITER //
CREATE FUNCTION booking_status3() returns VARCHAR (20)
deterministic
BEGIN
DECLARE size VARCHAR (20);
if 'course_delegate_numbers' > 5 THEN
set size = 'on track';
elseif 'course_delegate_numbers' <= 5 then
set size = 'not on track';
end if;
return (size);
end //
delimiter ;

select*from mole_programme_courses;

select course_id, course_venue, course_delegate_numbers, booking_status3() from mole_programme_courses;

-- create stored procedure

DELIMITER // 
CREATE PROCEDURE venue_filter3()
BEGIN SELECT course_id, course_venue from mole_programme_courses where course_venue = 'online';
END //
DELIMITER ;

CALL venue_filter3();

-- example query and subquery that demonstrates extracting data for analysis

select sub.* from (select delegate_organisation, course_id, delegate_name from course_lists where delegate_organisation = 'Mole_Green') sub where sub.course_id = 'Neuro021030';

-- create view

create or replace view Pedagog141030 as
select delegate_name, delegate_organisation, project_status from course_lists where course_id = 'Pedagog141030'
with check option;

select* from Pedagog141030;

--  create trigger

delimiter //
create trigger capitalise_owner
before insert on mole_programme_impact_evaluation_projects
for each row begin
set new.project_owner = upper(substring(new.project_owner from 1));
end //
delimiter ; 

insert into mole_programme_impact_evaluation_projects (project_name, impact_project_code, project_owner, project_status, insight_ID)
values ('Neuroscience_health_impact', 'REA07', 'stakeholder1', 'In_Progress', 3);

select* from mole_programme_impact_evaluation_projects;

-- create view with 3 base tables and use a query to extract info, joining tables 1,2 and 5

create view course_id_beneficiaries as select m.impact_project_code, m.course_id, m.course_name, i.delegate_organisation, i.beneficiaries, mp.project_name, mp.project_owner 
from mole_programme_courses m join impact_insights i on m.impact_project_code = i.impact_project_code
join mole_programme_impact_evaluation_projects mp on mp.impact_project_code = m.impact_project_code;

select* from course_id_beneficiaries;

-- query that uses group by and having using table 3

select delegate_organisation, count(c.delegate_organisation) from course_lists c group by c.delegate_organisation having count(c.delegate_organisation) >4;

-- create event

delimiter //
create event remove_rea07
on schedule at now() + interval 60 second
do begin
delete from mole_programme_impact_evaluation_projects where impact_project_code = 'rea07';
end //
delimiter ;

select* from mole_programme_impact_evaluation_projects;



