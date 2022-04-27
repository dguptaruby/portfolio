# README
Prerequisites
The setups steps expect following tools installed on the system.

Ruby 3.0.2
Rails 7.0.2

1. config database username and password in database.yml file
   
2. Create and setup the database
   Run the following commands to create and setup the database.

   bundle install   
   rake db:create
   rails db:migrate   

3. Start the Rails server

   bundle exec rails s
   And now you can visit the site with the URL http://localhost:3000