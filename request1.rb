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
    access_token: "zHW9GDY3mmS0AV157Cqx4w",
    uid: 'bobba.surendra@gmail.com',
    client: "AjY_y00fSxeGk4T6RWzAEg"
}
response = RestClient.post 'http://localhost:3000/models/serie_3/model_types_price/330i', {
#response = RestClient.post 'https://www.pacreception.com/oauth/token', {
    base_price: 3000
},headers

puts response.inspect

parsed_data = JSON.parse(response)
token = parsed_data['access-token']
client = parsed_data['client']
puts token
