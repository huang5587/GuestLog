# Guest Log in React & Ruby 

## Starting the Application

This project is deployed on Ruby on Rails. 

The official instructions to install Ruby are here: https://www.ruby-lang.org/en/downloads/

The official instructions to install Rails are here: https://guides.rubyonrails.org/v5.0/getting_started.html

The yarn package manager is used to keep dependencies up to date. The instructions to install yarn are here: https://www.hostinger.com/tutorials/how-to-install-yarn

Once these libraries are installed on your system you can access the web-app with the following.

```
bundle install
yarn build
rails server -p 3000
```
At this point you should be able to access the website by navigating to http://localhost:3000/
## Accessing the server

```
open http://localhost:3000/
```

## Product Brief


1 - Setting up a component in React to submit full name and phone number with the acceptance criteria below:

- If a user enters a full name (min. two words) and a valid phone number (10 or 11 digits), they should see the success screen with their name.
- If a user enters a name that has less than two words, they should see an error message (* must be your first and last name)
- If a user enters a phone number that is invalid, they should see an error message (* numbers only (ex. 1231231234))

Please check out designs file in the root folder.

2 - Create the API endpoint in Rails to receive the data and validate entry before storing it
- If a user submits a valid entry, the API should return a 201 OK response and store the user data in the DB
- If a user submits an invalid entry, the API should return a 400 response and not store the user data in the DB

