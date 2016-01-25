== README
#### Ruby version 2.2 or above is needed

 ####Rails version 4.2.5

#### Application up and running.

 To setup app run these commands
 ```
 bundle install && rake db:migrate && rake db:seed
 ```
* By default Authentication of API is disabled, to test apis use this commands below
  1. <tt>curl http://localhost:3000/models/serie_100/model_types</tt> to test API 1
  2. <tt>curl -d "base_price=1000" http://localhost:3000/models/serie_100/model_types_price/bmw_11</tt> to test API 2
* To test with ruby script which is in the project folder, run
  1. <tt>ruby test_api_with_authentication.rb</tt> - This will test both API1 and API2

##### Configuration
  * To enable authentication of APIs *uncomment* the authenticate_user! filters in the controllers
  * Then run `ruby test_api_with_authentication.rb` to test if authentication is working.


* How to run the test suite
  1. For test suite to run, authentication should be disabled.
  2. run `rspec` to run all test cases

 #### Implementation Details:-
1. 'devise_token_auth' gem for authentication of API - a token-based authentication strategy is used here along with devise.
2. Using sqlite3 as database.
3. Used rails model concerns to add the total price calculation module.
4. Rspec for testing models and controllers and `factory_girl` for dynamic generation of test data.
5. Implemented both the APIs with the exact param names in the routes as well.
6. Using STI for organisation types, hence created 3 extra classes for service,dealer and showroom.




