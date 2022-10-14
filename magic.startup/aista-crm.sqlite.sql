
/*
 * SQLite script to create "aista-crm" database.
 */


/*
 * Status table, implying what the status of some account is, such
 * as lead, partner or client.
 */
create table status(
  status text not null primary key,
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
  account_id integer not null primary key autoincrement,
  status text not null references status(status),
  created timestamp not null default current_timestamp,
  name text not null,
  website text,
  account_manager text /* Username of employee responsible for following up on account */
);


/*
 * A contact is a person belonging to an account, such as
 * an employee working for a company.
 */
create table contacts(
  contact_id integer not null primary key autoincrement,
  account_id integer references accounts(account_id),
  created timestamp not null default current_timestamp,
  name text not null,
  phone text,
  email text,
  country text,
  city text,
  linkedIn text,
  meta text
);


/*
 * Activity related tables. Activities are associated with contacts, and might
 * include things such as phone conversations, meetings, etc.
 */
create table activity_types(
  type text not null primary key,
  description text
);

insert into activity_types(type, description) values ('Phone', 'A phone call was made');
insert into activity_types(type, description) values ('Meeting', 'A meeting was held');
insert into activity_types(type, description) values ('Email', 'An email was sent');

create table activities(
  activity_id integer not null primary key autoincrement,
  type text not null references activity_types(type),
  contact_id integer references contacts (contact_id),
  created timestamp not null default current_timestamp,
  username text not null,
  description text,
  closed timestamp
);


/*
 * Notifications sent to users about important information, such that
 * an account or a lead has been assigned to the user, etc.
 */
create table notifications(
  notification_id integer not null primary key autoincrement,
  created timestamp not null default current_timestamp,
  username text not null,
  message text not null
);
