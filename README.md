# Aista CRM

A micro SQLite CRM database useful as a starter kit for your own custom CRM.
Notice, it _only_ supports SQLite currently. The system is tiny in size, and
only contains 8 unique tables, being as follows.

* __accounts__ - A client account, the primary table of the system
* __contacts__ - A contact associated with an account
* __status__ - Types of accounts
* __employees__ - Employee in your company
* __activities__ - A single activity, such as a phone call, meeting, etc
* __activity_types__ - Type of activity
* __activities_contacts__ - An association between an activity and a contact
* __activities_employees__ - An association between an activity and an employee

Each account is associated with an employee being the _"key account manager"_ for
that specific account.

## Customisable

The idea of the database is to allow for you to modify it as you see fit, for then
to generate a CRUD backend, optionally add Hyperlambda business logic to it, for
then to generate an Angular frontend wrapping the backend.

## License

All code in this plugin is published under the terms of the MIT license as published
by the Open Source Initiative. See the LICENSE file for details.

