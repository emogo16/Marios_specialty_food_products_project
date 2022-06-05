# Marios Specialty Food Products 


#### By _**Erika Estefania Mogollon**_

## Technologies Used

* _Git Bash_
* _VS Code_
* Ruby on Rails
* _Rspec_
* _Pry_
* _Gemfile_
* _Github_
* _Capybara_
* _Sinatra_
*  _Postgres_
*  _PSQL
*  _ActiveRecord


## Description

This will allow a user to add food products and reviews. It will also allow the user to view, update, and delete products. 

## Setup/Installation Requirements

Go  to your web browser of your choice.

Then clone this reposiroty to your device. $git clone

Then you will open up the folder with VSCode.

Navigate to your root directory and bundle install the project

If you are on windows you will need to create a file in the root directory of the project called 'db_access.rb' and within that file you will need to add the following: "DB = PG.connect({:dbname => 'volunteer_tracker', :password => '[YOUR PASSWORD GOES HERE]'})".

If on mac you will need to navigate to 'spec_helper.rb' and add 'DB = PG.connect({:dbname => 'volunteer_tracker})' below the require statements.

Create your database, type in 'createdb[DATABASE NAME]'

psql [DATABASE NAME] < database_backup.sql * If on windows run the aforementioned command adding .exe after psql ex. 'psql.exe [DATABASE NAME] < database_backup.sql'

createdb -T [DATABASE NAME] [TEST DATABASE NAME]

In the terminal run command 'rspec' to see that the test are passing

In the termal run command 'ruby app.rb' to start up server

In your browser navigate to 'localhost:4567'

From here you can have some fun
## Known Bugs

There is no known bugs at the moment

## License

https://en.wikipedia.org/wiki/MIT_License

Copyright (c) _1/13/2022_ _Erika Estefania Mogollon_
