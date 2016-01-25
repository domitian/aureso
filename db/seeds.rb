# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
org = Organisation.create(name: "pekka",public_name: "Pekka",pricing_policy: "Flexible")
mod = Model.create(name: "serie_100",organisation_id: org.id)
ModelType.create(name: "bmw_11",base_price: "80000",model_id: mod.id)
# creating dummy user for authentication purposes as well
User.new(email: "bob@gmail.com",password: "aureso",password_confirmation: "aureso").save!(validate: false)
