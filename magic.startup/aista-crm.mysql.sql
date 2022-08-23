

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE status(
  status_id integer not null primary key AUTO_INCREMENT,
  status varchar(10) not null unique
)

-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into status (status) values ('Lead');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into status (status) values ('Client') ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE activity_types(
  activity_type_id integer not null primary key AUTO_INCREMENT,
  type varchar(10) not null unique
)  

-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into activity_types(type) values ('Phone');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into activity_types(type) values ('Meeting');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
insert into activity_types(type) values ('Email');



-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE employees(
  employee_id integer not null primary key AUTO_INCREMENT,
  name varchar(30) not null,
  email varchar(30),
  phone varchar(20),
  linkedIn varchar(30),
  facebook varchar(30),
  twitter varchar(30)
)

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE activities(
  activity_id integer not null primary key AUTO_INCREMENT,
  created timestamp not null default current_timestamp,
  activity_type integer not null references activity_types(activity_type_id),
  name varchar(30) not null,
  description text
)  

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE accounts(
  account_id integer not null primary key AUTO_INCREMENT,
  status integer not null references status(status_id),
  name varchar(30) not null,
  account_manager integer references employees(employee_id)
) 

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE contacts(
  contact_id integer not null primary key AUTO_INCREMENT,
  account integer not null references accounts(account_id),
  name varchar(30) not null,
  phone varchar(20),
  email varchar(30),
  country varchar(20),
  city varchar(20),
  linkedIn varchar(30),
  facebook varchar(30),
  twitter varchar(30)
) 

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE activities_contacts(
  activity_id integer not null references activities (activity_id),
  contact_id integer not null references contacts (contact_id),
  primary key(activity_id, contact_id)
)

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE activities_employees(
  activity_id integer not null references activities (activity_id),
  employee_id integer not null references employees (employee_id),
  primary key(activity_id, employee_id)
) 

