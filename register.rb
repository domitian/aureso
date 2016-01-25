require 'rest-client'
require 'json'

# Create user
#response = RestClient.post 'http://localhost:3000/auth', {
#response = RestClient.post 'https://www.pacreception.com/oauth/token', {
    #email: 'bobba.surendra@gmail.com',
    #password: 'vnitnagpur',
    #password_confirmation: 'vnitnagpur'
#}
#
#puts response.inspect
#
#token = JSON.parse(response)


response = RestClient.post 'http://localhost:3000/auth/sign_in', {
#response = RestClient.post 'https://www.pacreception.com/oauth/token', {
    email: 'bobba.surendra@gmail.com',
    password: 'vnitnagpur'
}

puts response.headers.inspect

parsed_data = JSON.parse(response)
token = parsed_data['access-token']
client = parsed_data['client']
puts token
