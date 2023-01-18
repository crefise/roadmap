#---------------------------------------------------------------------------------#
# Base navigation
create database if not exists roadmap;
use roadmap;
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Creation table
drop table if exists skills;
create table if not exists skills
(
    id int not null auto_increment,
    name varchar(30) not null ,
    description TEXT(50),
    status enum('completed', 'in_progress', 'to_do') default 'to_do',
    primary key (id)
);
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Get info about created table
show tables;
desc skills;
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Insert columns
insert into skills(name, description, status) values ('Skill_1', 'Skill 1 description', 'completed');
insert into skills(name, description, status) values ('Skill_2', 'Skill 2 description', 'in_progress');
insert into skills(name, description, status) values ('Skill_3', 'Skill 3 description', 'completed');
insert into skills(name, description, status) values ('Skill_4', 'Skill 4 description', 'in_progress');
insert into skills(name, description, status) values ('Skill_5', 'Skill 5 description', 'completed');
insert into skills(name) values ('Skill_6');
insert into skills(name) values ('Skill_7');
insert into skills(name) values ('Skill_8');
insert into skills(name) values ('Skill_9');
insert into skills(name) values ('Skill_10');
insert into skills(name, description) values ('Skill_11', 'Skill 11 description');
insert into skills(name, description) values ('Skill_12', 'Skill 12 description');
insert into skills(name, description) values ('Skill_13', 'Skill 13 description');
insert into skills(name, description) values ('Skill_14', 'Skill 14 description');
insert into skills(name, description) values ('Skill_15', 'Skill 15 description');
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Work with select
select * from skills;
select id, name from skills;
select id as superId, name as superName from skills;
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Create new one table
drop table if exists users;
create table if not exists users
(
    id int not null auto_increment,
    name varchar(30) not null,
    role enum('teacher', 'student') not null,
    primary key (id)
);
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Editing table
alter table users rename column name to full_name;
alter table users rename column full_name to name;
alter table skills add created_by int not null;
alter table skills MODIFY created_by int;
update skills set created_by = null where created_by = 0;
alter table skills add foreign key (created_by) references users(id) on delete cascade;
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Insert data in table
insert into users(name, role) values ('Man_1', 'student');
insert into users(name, role) values ('Man_1', 'teacher');
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Insert data with foreign key
insert into skills(name, description, created_by) values ('Skill_16', 'Skill 16 description', 1);
insert into skills(name, description, created_by) values ('Skill_17', 'Skill 17 description', 1);
insert into skills(name, description, created_by) values ('Skill_18', 'Skill 18 description', 1);
insert into skills(name, description, created_by) values ('Skill_19', 'Skill 19 description', 2);
insert into skills(name, description, created_by) values ('Skill_20', 'Skill 20 description', 2);
insert into skills(name, description, created_by) values ('Skill_20', 'Skill 20 description', 4);
insert into skills(name, description, created_by) values ('Skill_20', 'Skill 20 description', 4);
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Work with select
select * from skills;
select * from skills left join users on skills.created_by = users.id;
select * from skills right join users on skills.created_by = users.id;
select * from skills inner join users on skills.created_by = users.id;
select users.name as creatorFullName, skills.name as skillName, skills.status  from skills left join users on skills.created_by = users.id;
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Work with group by
select count(id), status from skills group by status;
select count(skills.id) as countOfSkills, skills.status as skillStatus, users.name from skills left join users on skills.created_by = users.id group by skills.status, users.name;
select count(users.id) as userCount, status from skills left join users on skills.created_by = users.id group by status;
#---------------------------------------------------------------------------------#

# Work with union
#---------------------------------------------------------------------------------#
select * from skills where id > 10 union select * from skills where  id <= 10;
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Work with where
select * from skills where status = 'to_do';
explain select * from skills where status = 'to_do';
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Creation and removing simple index
create index skills_status_index on skills (status);
drop index skills_status_index on skills;

# You can see more that select using a few row using index
explain select * from skills where status = 'to_do';
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Creation, testing, removing multi indexes
create index skills_status_and_created_by_index on skills (status, created_by);
drop index skills_status_and_created_by_index on skills;

# You can see more that select using a few row using index
explain select * from skills where status = 'to_do' and created_by = 1;
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Work with unique index
create table games(
    id int unsigned auto_increment,
    name varchar(30) unique,
    second_name varchar(30),
    PRIMARY KEY (id)
);

insert games(name, second_name) values ('test', 'test1');
insert games(name, second_name) values ('test2', 'test2');
insert games(name, second_name) values ('test3', 'test3');
insert games(name, second_name) values ('test4', 'test4');
insert games(name, second_name) values ('test5', 'test5');

insert games(name, second_name) values ('test5', 'test5');

explain select * from games where name = 'test3';
explain select * from games where second_name = 'test3';

create unique index unique_index on games(second_name);
drop index unique_index on games;
#---------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------#
# Work with full text index
drop table if exists books;
create table if not exists books
(
    id int not null auto_increment,
    name varchar(30) not null ,
    description TEXT(50),
    FULLTEXT (description),
    primary key (id)
);

insert into books(name, description) values ('Skill_1', 'Skill 1 description');
insert into books(name, description) values ('Skill_2', 'Skill 2 description word 123 123 123dd');
insert into books(name, description) values ('Skill_3', 'Skill 3 description');
insert into books(name, description) values ('Skill_4', 'Skill 4 description');


select * from books;

explain select * from books where description like '%word%';
explain select * from books where match(description) against ('word');
#---------------------------------------------------------------------------------#
