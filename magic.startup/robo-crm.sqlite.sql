
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
  status text not null references status(status) default 'Lead',
  created timestamp not null default current_timestamp,
  name text not null,
  website text null,
  description text null
);

insert into accounts (status, name, website, description) values ('Lead', 'Microsoft', 'http://microsoft.com', 'Leading provider of tech solutions');
insert into accounts (status, name, website, description) values ('Lead', 'Apple', 'http://apple.com', 'Leading provider of tech solutions');
insert into accounts (status, name, website, description) values ('Client', 'JP Morgan', 'http://jpmorgan.com', 'Global financial services');
insert into accounts (status, name, website, description) values ('Partner', 'Ernst & Young', 'http://ey.com', 'Global financial services');
insert into accounts (status, name, website, description) values ('Client', 'New York Times', 'http://nyt.com', 'Leaders in media');
insert into accounts (status, name, website, description) values ('Client', 'Wall Street Journal', 'http://wsj.com', 'Publisher');
insert into accounts (status, name, website, description) values ('Partner', 'Amazon', 'http://amazon.com', 'Experts in e-commerce');
insert into accounts (status, name, website, description) values ('Client', 'Google', 'http://google.com', 'Leading online search engine');
insert into accounts (status, name, website, description) values ('Client', 'PwC', 'http://pwc.com', 'Innovators in financial sector');
insert into accounts (status, name, website, description) values ('Client', 'OpenAI', 'http://openai.com', 'Top AI company');
insert into accounts (status, name, website, description) values ('Lead', 'Tesla', 'http://tesla.com', 'Specialists in electrical vehicles');
insert into accounts (status, name, website, description) values ('Client', 'Twitter', 'http://twitter.com', 'Social media platform');



/*
 * A contact is a person belonging to an account, such as
 * an employee working for a company.
 */
create table contacts(
  contact_id integer not null primary key autoincrement,
  account_id integer references accounts(account_id),
  created timestamp not null default current_timestamp,
  email text not null,
  name text not null,
  phone text null,
  description text null
);

insert into contacts (account_id, name, phone, email, description) values (1, 'John Doe', '555-1234', 'john.doe@example.com', 'Just some random dude. I suspect he is lying on his name.');
insert into contacts (account_id, name, phone, email, description) values (2, 'Jane Smith', '555-5678', 'jane.smith@example.com', 'Sent 3 emails');
insert into contacts (account_id, name, phone, email, description) values (3, 'Alice Johnson', '555-8765', 'alice.johnson@example.com', 'Called her a month ago');
insert into contacts (account_id, name, phone, email, description) values (4, 'Bob Brown', '555-4321', 'bob.brown@example.com', 'Lives in Iowa');
insert into contacts (account_id, name, phone, email, description) values (5, 'Charlie Davis', '555-6789', 'charlie.davis@example.com', 'Has a dog named Jerry');
insert into contacts (account_id, name, phone, email, description) values (6, 'Diana Evans', '555-9876', 'diana.evans@example.com', 'Loves Google');
insert into contacts (account_id, name, phone, email, description) values (7, 'Evan Foster', '555-5432', 'evan.foster@example.com', 'Taking him to Super Bowl next year');
insert into contacts (account_id, name, phone, email, description) values (8, 'Fiona Green', '555-2109', 'fiona.green@example.com', 'Does not want to be pitched');
insert into contacts (account_id, name, phone, email, description) values (9, 'George Harris', '555-6543', 'george.harris@example.com', 'Already has another similar product, but wants to see ours');
insert into contacts (account_id, name, phone, email, description) values (10, 'Hannah White', '555-3210', 'hannah.white@example.com', 'Loves mountain hiking');
insert into contacts (account_id, name, phone, email, description) values (1, 'Ivy Clark', '555-1111', 'ivy.clark@example.com', 'We were supposed to get back to her in 2025');
insert into contacts (account_id, name, phone, email, description) values (2, 'Jack Wilson', '555-2222', 'jack.wilson@example.com', 'Has a Volvo she loves');
insert into contacts (account_id, name, phone, email, description) values (3, 'Karen Martinez', '555-3333', 'karen.martinez@example.com', 'Does not like to be called');
insert into contacts (account_id, name, phone, email, description) values (4, 'Leo Robinson', '555-4444', 'leo.robinson@example.com', 'Loves our products');
insert into contacts (account_id, name, phone, email, description) values (5, 'Mia Lewis', '555-5555', 'mia.lewis@example.com', 'US citizen');
insert into contacts (account_id, name, phone, email, description) values (6, 'Noah Walker', '555-6666', 'noah.walker@example.com', 'Soccer fan, loves Liverpool');
insert into contacts (account_id, name, phone, email, description) values (7, 'Olivia Hall', '555-7777', 'olivia.hall@example.com', 'Likes UFC');
insert into contacts (account_id, name, phone, email, description) values (8, 'Paul Young', '555-8888', 'paul.young@example.com', 'Travels to Hing Kong');
insert into contacts (account_id, name, phone, email, description) values (9, 'Quinn King', '555-9999', 'quinn.king@example.com', 'Lives in Switzerland');
insert into contacts (account_id, name, phone, email, description) values (10, 'Rachel Scott', '555-0000', 'rachel.scott@example.com', 'Nice lady, has a dog');

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
  description text
);

insert into activities (type, contact_id, description) values 
('Phone', 8, 'Phone call to discuss marketing strategies.'),
('Email', 13, 'Sent email regarding quarterly sales figures.'),
('Meeting', 6, 'Scheduled meeting to discuss project risks.'),
('Misc', 11, 'Office arrangement and resource allocation.'),
('Phone', 20, 'Conference call with product development team.'),
('Email', 2, 'Email sent with attachment of meeting notes.'),
('Meeting', 14, 'Meeting to finalize the software release date.'),
('Misc', 7, 'Miscellaneous task related to client feedback.'),
('Phone', 15, 'Discussed client requirements and expectations.'),
('Email', 1, 'Confirmation email sent to the supplier.'),
('Meeting', 4, 'Weekly team meeting on project progress.'),
('Misc', 18, 'Checked inventory status and updated records.'),
('Phone', 10, 'Negotiation call with a new vendor.'),
('Email', 5, 'Reminder emails for year-end tax preparations.'),
('Meeting', 9, 'Client meeting to discuss feedback on the demo.'),
('Misc', 3, 'Organized files and updated database records.'),
('Phone', 16, 'Discussed logistics and shipping timelines.'),
('Email', 12, 'Sent proposal draft for review.'),
('Meeting', 17, 'Internal review meeting regarding IT security.'),
('Misc', 19, 'Routine maintenance of office equipment.'),
('Phone', 13, 'Client call to discuss account setup.'),
('Email', 6, 'Email to clarify project specifications.'),
('Meeting', 8, 'Budget meeting with finance department.'),
('Misc', 20, 'Scheduled regular health and safety inspection.'),
('Phone', 4, 'Support call regarding software installation issues.'),
('Email', 11, 'Email follow-up after product launch.'),
('Meeting', 2, 'Strategy meeting for upcoming marketing campaigns.'),
('Misc', 7, 'Updated project timelines and milestones.'),
('Phone', 14, 'Called to update on delivery status of equipment.'),
('Email', 9, 'Sent updated contract for signature.'),
('Meeting', 18, 'Review meeting with external auditors.'),
('Misc', 1, 'Data entry and processing of new client forms.'),
('Phone', 5, 'Discussed renewal terms with existing client.'),
('Email', 10, 'Email notification to attend training session.'),
('Meeting', 3, 'Quarterly sales review meeting.'),
('Misc', 15, 'Preparation of presentation materials for board meeting.'),
('Phone', 12, 'Discussed feedback on web portal updates.'),
('Email', 17, 'Sent email to confirm meeting details.'),
('Meeting', 16, 'Initial meeting with potential business partners.'),
('Misc', 6, 'Conducted software upgrade for office computers.'),
('Phone', 19, 'Technical support call with IT services.'),
('Email', 2, 'Email update to clients about new services.'),
('Meeting', 14, 'Team debrief on recent project completion.'),
('Misc', 4, 'Sorting and archiving last year''s project files.'),
('Phone', 8, 'Coordinating with suppliers on order details.'),
('Email', 13, 'Email to schedule software demonstration.'),
('Meeting', 11, 'Meeting to discuss user experience improvements.'),
('Misc', 20, 'General updates to internal CRM systems.'),
('Phone', 5, 'Call to discuss remote working tools and platforms.'),
('Email', 9, 'Sent summary of key discussion points from last meeting.'),
('Meeting', 17, 'Annual review meeting with all department heads.');

