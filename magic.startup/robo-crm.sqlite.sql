
/*
 * SQLite script to create "robo-crm" database.
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
  description text,
  account_manager text /* Username of employee responsible for following up on account */
);

insert into accounts (status, name, website, description, account_manager) values ('Lead', 'Microsoft', 'http://microsoft.com', 'Leading provider of tech solutions', 'John');
insert into accounts (status, name, website, description, account_manager) values ('Lead', 'Apple', 'http://apple.com', 'Leading provider of tech solutions', 'John');
insert into accounts (status, name, website, description, account_manager) values ('Client', 'JP Morgan', 'http://jpmorgan.com', 'Global financial services', 'John');
insert into accounts (status, name, website, description, account_manager) values ('Partner', 'Ernst & Young', 'http://ey.com', 'Global financial services', 'Peter');
insert into accounts (status, name, website, description, account_manager) values ('Client', 'New York Times', 'http://nyt.com', 'Leaders in media', 'Peter');
insert into accounts (status, name, website, description, account_manager) values ('Client', 'Wall Street Journal', 'http://wsj.com', 'Publisher', 'Peter');
insert into accounts (status, name, website, description, account_manager) values ('Partner', 'Amazon', 'http://amazon.com', 'Experts in e-commerce', 'Jane');
insert into accounts (status, name, website, description, account_manager) values ('Client', 'Google', 'http://google.com', 'Leading online search engine', 'Peter');
insert into accounts (status, name, website, description, account_manager) values ('Client', 'PwC', 'http://pwc.com', 'Innovators in financial sector', 'Jane');
insert into accounts (status, name, website, description, account_manager) values ('Client', 'OpenAI', 'http://openai.com', 'Top AI company', 'Jane');
insert into accounts (status, name, website, description, account_manager) values ('Lead', 'Tesla', 'http://tesla.com', 'Specialists in electrical vehicles', 'Carol');
insert into accounts (status, name, website, description, account_manager) values ('Client', 'Twitter', 'http://twitter.com', 'Social media platform', 'Carol');



/*
 * A contact is a person belonging to an account, such as
 * an employee working for a company.
 */
create table contacts(
  contact_id integer not null primary key autoincrement,
  account_id integer references accounts(account_id),
  created timestamp not null default current_timestamp,
  name text,
  phone text,
  email text,
  country text,
  city text,
  linkedIn text,
  source text,
  meta text,
  description text,
  subscriber integer default 0
);

insert into contacts (account_id, name, phone, email, country, description) values (1, 'John Doe', '555-1234', 'john.doe@example.com', 'USA', 'Sample description 1');
insert into contacts (account_id, name, phone, email, country, description) values (2, 'Jane Smith', '555-5678', 'jane.smith@example.com', 'Canada', 'Sample description 2');
insert into contacts (account_id, name, phone, email, country, description) values (3, 'Alice Johnson', '555-8765', 'alice.johnson@example.com', 'UK', 'Sample description 3');
insert into contacts (account_id, name, phone, email, country, description) values (4, 'Bob Brown', '555-4321', 'bob.brown@example.com', 'Australia', 'Sample description 4');
insert into contacts (account_id, name, phone, email, country, description) values (5, 'Charlie Davis', '555-6789', 'charlie.davis@example.com', 'Germany', 'Sample description 5');
insert into contacts (account_id, name, phone, email, country, description) values (6, 'Diana Evans', '555-9876', 'diana.evans@example.com', 'France', 'Sample description 6');
insert into contacts (account_id, name, phone, email, country, description) values (7, 'Evan Foster', '555-5432', 'evan.foster@example.com', 'Italy', 'Sample description 7');
insert into contacts (account_id, name, phone, email, country, description) values (8, 'Fiona Green', '555-2109', 'fiona.green@example.com', 'Spain', 'Sample description 8');
insert into contacts (account_id, name, phone, email, country, description) values (9, 'George Harris', '555-6543', 'george.harris@example.com', 'Netherlands', 'Sample description 9');
insert into contacts (account_id, name, phone, email, country, description) values (10, 'Hannah White', '555-3210', 'hannah.white@example.com', 'Sweden', 'Sample description 10');
insert into contacts (account_id, name, phone, email, country, description) values (1, 'Ivy Clark', '555-1111', 'ivy.clark@example.com', 'USA', 'Sample description 11');
insert into contacts (account_id, name, phone, email, country, description) values (2, 'Jack Wilson', '555-2222', 'jack.wilson@example.com', 'Canada', 'Sample description 12');
insert into contacts (account_id, name, phone, email, country, description) values (3, 'Karen Martinez', '555-3333', 'karen.martinez@example.com', 'UK', 'Sample description 13');
insert into contacts (account_id, name, phone, email, country, description) values (4, 'Leo Robinson', '555-4444', 'leo.robinson@example.com', 'Australia', 'Sample description 14');
insert into contacts (account_id, name, phone, email, country, description) values (5, 'Mia Lewis', '555-5555', 'mia.lewis@example.com', 'Germany', 'Sample description 15');
insert into contacts (account_id, name, phone, email, country, description) values (6, 'Noah Walker', '555-6666', 'noah.walker@example.com', 'France', 'Sample description 16');
insert into contacts (account_id, name, phone, email, country, description) values (7, 'Olivia Hall', '555-7777', 'olivia.hall@example.com', 'Italy', 'Sample description 17');
insert into contacts (account_id, name, phone, email, country, description) values (8, 'Paul Young', '555-8888', 'paul.young@example.com', 'Spain', 'Sample description 18');
insert into contacts (account_id, name, phone, email, country, description) values (9, 'Quinn King', '555-9999', 'quinn.king@example.com', 'Netherlands', 'Sample description 19');
insert into contacts (account_id, name, phone, email, country, description) values (10, 'Rachel Scott', '555-0000', 'rachel.scott@example.com', 'Sweden', 'Sample description 20');

/*
 * Activity related tables. Activities are associated with contacts, and might
 * include things such as phone conversations, meetings, etc.
 */
create table activity_types(
  type text not null primary key,
  description text
);

insert into activity_types(type, description) values ('Misc', 'Misc activity');
insert into activity_types(type, description) values ('Phone', 'A phone call was made');
insert into activity_types(type, description) values ('Meeting', 'A meeting was held');
insert into activity_types(type, description) values ('Email', 'An email was sent');

create table activities(
  activity_id integer not null primary key autoincrement,
  type text not null references activity_types(type),
  contact_id integer references contacts (contact_id),
  created timestamp not null default current_timestamp,
  due timestamp not null default current_timestamp,
  username text not null,
  description text,
  closed timestamp,
  notified integer not null default 0
);

insert into activities (type, contact_id, username, description) values 
('Phone', 8, 'root', 'Phone call to discuss marketing strategies.'),
('Email', 13, 'root', 'Sent email regarding quarterly sales figures.'),
('Meeting', 6, 'root', 'Scheduled meeting to discuss project risks.'),
('Misc', 11, 'root', 'Office arrangement and resource allocation.'),
('Phone', 20, 'root', 'Conference call with product development team.'),
('Email', 2, 'root', 'Email sent with attachment of meeting notes.'),
('Meeting', 14, 'root', 'Meeting to finalize the software release date.'),
('Misc', 7, 'root', 'Miscellaneous task related to client feedback.'),
('Phone', 15, 'root', 'Discussed client requirements and expectations.'),
('Email', 1, 'root', 'Confirmation email sent to the supplier.'),
('Meeting', 4, 'root', 'Weekly team meeting on project progress.'),
('Misc', 18, 'root', 'Checked inventory status and updated records.'),
('Phone', 10, 'root', 'Negotiation call with a new vendor.'),
('Email', 5, 'root', 'Reminder emails for year-end tax preparations.'),
('Meeting', 9, 'root', 'Client meeting to discuss feedback on the demo.'),
('Misc', 3, 'root', 'Organized files and updated database records.'),
('Phone', 16, 'root', 'Discussed logistics and shipping timelines.'),
('Email', 12, 'root', 'Sent proposal draft for review.'),
('Meeting', 17, 'root', 'Internal review meeting regarding IT security.'),
('Misc', 19, 'root', 'Routine maintenance of office equipment.'),
('Phone', 13, 'root', 'Client call to discuss account setup.'),
('Email', 6, 'root', 'Email to clarify project specifications.'),
('Meeting', 8, 'root', 'Budget meeting with finance department.'),
('Misc', 20, 'root', 'Scheduled regular health and safety inspection.'),
('Phone', 4, 'root', 'Support call regarding software installation issues.'),
('Email', 11, 'root', 'Email follow-up after product launch.'),
('Meeting', 2, 'root', 'Strategy meeting for upcoming marketing campaigns.'),
('Misc', 7, 'root', 'Updated project timelines and milestones.'),
('Phone', 14, 'root', 'Called to update on delivery status of equipment.'),
('Email', 9, 'root', 'Sent updated contract for signature.'),
('Meeting', 18, 'root', 'Review meeting with external auditors.'),
('Misc', 1, 'root', 'Data entry and processing of new client forms.'),
('Phone', 5, 'root', 'Discussed renewal terms with existing client.'),
('Email', 10, 'root', 'Email notification to attend training session.'),
('Meeting', 3, 'root', 'Quarterly sales review meeting.'),
('Misc', 15, 'root', 'Preparation of presentation materials for board meeting.'),
('Phone', 12, 'root', 'Discussed feedback on web portal updates.'),
('Email', 17, 'root', 'Sent email to confirm meeting details.'),
('Meeting', 16, 'root', 'Initial meeting with potential business partners.'),
('Misc', 6, 'root', 'Conducted software upgrade for office computers.'),
('Phone', 19, 'root', 'Technical support call with IT services.'),
('Email', 2, 'root', 'Email update to clients about new services.'),
('Meeting', 14, 'root', 'Team debrief on recent project completion.'),
('Misc', 4, 'root', 'Sorting and archiving last year''s project files.'),
('Phone', 8, 'root', 'Coordinating with suppliers on order details.'),
('Email', 13, 'root', 'Email to schedule software demonstration.'),
('Meeting', 11, 'root', 'Meeting to discuss user experience improvements.'),
('Misc', 20, 'root', 'General updates to internal CRM systems.'),
('Phone', 5, 'root', 'Call to discuss remote working tools and platforms.'),
('Email', 9, 'root', 'Sent summary of key discussion points from last meeting.'),
('Meeting', 17, 'root', 'Annual review meeting with all department heads.');

