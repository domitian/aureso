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

headers = {
    access_token: "3vnAHOwm-iNrliWwU7W0fA",
    uid: 'bobba.surendra@gmail.com',
    client: "lZJ3mFT_DRCydz3MLyTVxA"
}
response = RestClient.get 'http://localhost:3000/models/serie_3/model_types',headers

puts response.inspect

parsed_data = JSON.parse(response)
token = parsed_data['access-token']
client = parsed_data['client']
puts token
