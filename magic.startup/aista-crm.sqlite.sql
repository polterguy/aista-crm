
/*
 * SQLite script to create "aista-crm" database.
 */
CREATE TABLE status(
  status_id integer not null primary key autoincrement,
  status varchar not null unique
);

insert into status (status) values ('Lead');
insert into status (status) values ('Client');

CREATE TABLE activity_types(
  activity_type_id integer not null primary key autoincrement,
  type varchar not null unique
);

insert into activity_types(type) values ('Phone');
insert into activity_types(type) values ('Meeting');
insert into activity_types(type) values ('Email');

CREATE TABLE employees(
  employee_id integer not null primary key autoincrement,
  name varchar not null,
  email varchar,
  phone varchar,
  linkedIn varchar,
  facebook varchar,
  twitter varchar
);

CREATE TABLE activities(
  activity_id integer not null primary key autoincrement,
  created timestamp not null default current_timestamp,
  activity_type integer not null references activity_types(activity_type_id),
  name varchar not null,
  description text
);

CREATE TABLE accounts(
  account_id integer not null primary key autoincrement,
  status integer not null references status(status_id),
  name varchar not null,
  account_manager integer references employees(employee_id)
);

CREATE TABLE contacts(
  contact_id integer not null primary key autoincrement,
  account integer not null references accounts(account_id),
  name varchar not null,
  phone varchar,
  email varchar,
  country varchar,
  city varchar,
  linkedIn varchar,
  facebook varchar,
  twitter varchar
);

CREATE TABLE activities_contacts(
  activity_id integer not null references activities (activity_id),
  contact_id integer not null references contacts (contact_id),
  primary key(activity_id, contact_id)
);

CREATE TABLE activities_employees(
  activity_id integer not null references activities (activity_id),
  employee_id integer not null references employees (employee_id),
  primary key(activity_id, employee_id)
);

