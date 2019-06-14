# README

* Ruby version: 2.6.1

* System dependencies

* Configuration <br><br>
    bundle install <br>
    You need to create a key value file called local_env.yml
    where values of username and password for local setup of database are going to be located with the key names of: 
    BMA_DDI_BACKEND_DATABASE_PASSWORD_DEV<br>
    BMA_DDI_BACKEND_DATABASE_PASSWORD_TEST<br>
    USERNAME_DEV<br>
    USERNAME_TEST<br>
    Values should be according to your own setup. These keys are used on the database.yml file.

* Database creation
rails db:setup
* Database initialization
rails db:migrate
* How to run the test suite
bundle exec rspec
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

