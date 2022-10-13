
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
  account_manager text /* Username of employee responsible for following up on account */
);


/*
 * A contact is a person belonging to an account, such as
 * an employee working for a company.
 */
create table contacts(
  contact_id integer not null primary key autoincrement,
  account_id integer not null references accounts(account_id),
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
  contact_id integer not null references contacts (contact_id),
  type text not null references activity_types(type),
  created timestamp not null default current_timestamp,
  description text not null
);


/*
 * Tasks that have been done or should be done. Each task is associated
 * with a user in the system.
 */
create table tasks(
  task_id integer not null primary key autoincrement,
  created timestamp not null default current_timestamp,
  username text
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


/*
 * KPI Hyperlambda snippets, allowing users to dynamically declare their own KPIs.
 */
create table kpi(
  kpi_id integer not null primary key autoincrement,
  name text not null unique,
  type text not null,
  hyperlambda text not null
);

insert into kpi(name, type, hyperlambda) values(
  'funnel',
  'pie',
  'data.connect:[generic|aista-crm]' || char(13) || char(10) ||
  '   data.select:select status as name, count(*) as value from accounts group by status' || char(13) || char(10) ||
  '   return-nodes:x:-/*' || char(13) || char(10)
);

