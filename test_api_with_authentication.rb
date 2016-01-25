require 'rest-client'
require 'json'
email = 'bob@gmail.com'
password = 'aureso'

# User Logging in
puts "User logging"
response = RestClient.post 'http://localhost:3000/auth/sign_in', {
#response = RestClient.post 'https://www.pacreception.com/oauth/token', {
    email: email,
    password: password
}

puts "User login successfull"
parsed_data = JSON.parse(response)
token = parsed_data['access-token']
client = parsed_data['client']
puts token

headers = {
    access_token: token,
    uid: email,
    client: client
}
response = RestClient.get 'http://localhost:3000/models/serie_3/model_types',headers
puts "request 1"
puts response.inspect

response = RestClient.post 'http://localhost:3000/models/serie_3/model_types_price/330i', {
    base_price: 3000
},headers
puts "request2"
puts response.inspect

