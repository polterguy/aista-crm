
/*
 * MySQL script to create "robo-crm" database.
 */

/*
 * Creating our Stripe database.
 */
create database `robo-crm`;

/*
 * Making sure we use stripe database.
 */
use `robo-crm`;


/*
 * Status table, implying what the status of some account is, such
 * as lead, partner or client.
 */
create table status(
  status varchar(50) not null primary key,
  description text
);

insert into status (status, description) values ('Lead', 'Not a client yet, but might be in the future');
insert into status (status, description) values ('Client', 'A client that is already purchasing services');
insert into status (status, description) values ('Partner', 'A partner helping us sell our services');


/*
 * An account is the primary entity in the system, and can be
 * a lead, a partner, or a client. Typically an account is a
 * company.
 */
create table accounts(
  account_id int(11) not null primary key auto_increment,
  status varchar(50) not null references status(status),
  created datetime not null default current_timestamp,
  name varchar(150) not null,
  website varchar(250),
  description text,
  account_manager varchar(250) /* Username of employee responsible for following up on account */
);


/*
 * A contact is a person belonging to an account, such as
 * an employee working for a company.
 */
create table contacts(
  contact_id int(11) not null primary key auto_increment,
  account_id int(11) references accounts(account_id),
  created datetime not null default current_timestamp,
  name varchar(250),
  phone varchar(50),
  email varchar(250),
  country varchar(50),
  city varchar(50),
  linkedIn varchar(250),
  source varchar(150),
  meta varchar(250),
  description text,
  subscriber int(11) default 0
);


/*
 * Activity related tables. Activities are associated with contacts, and might
 * include things such as phone conversations, meetings, etc.
 */
create table activity_types(
  type varchar(50) not null primary key,
  description text
);

insert into activity_types(type, description) values ('Misc', 'Misc activity');
insert into activity_types(type, description) values ('Phone', 'A phone call was made');
insert into activity_types(type, description) values ('Meeting', 'A meeting was held');
insert into activity_types(type, description) values ('Email', 'An email was sent');

create table activities(
  activity_id int(11) not null primary key auto_increment,
  type varchar(50) not null references activity_types(type),
  contact_id int(11) references contacts (contact_id),
  created datetime not null default current_timestamp,
  due datetime not null,
  username varchar(250) not null,
  description text,
  closed datetime,
  notified int(11) not null default 0
);


/*
 * Email blaster.
 */
create table email_templates(
  email_template_id int(11) not null primary key auto_increment,
  name varchar(150) not null,
  content text
);

create table emails(
  email_id int(11) primary key auto_increment,
  created datetime not null default current_timestamp,
  email_template_id int(11) references email_templates(email_template_id),
  title varchar(1024) not null,
  content text
);



