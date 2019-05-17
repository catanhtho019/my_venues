# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


venues = Venue.create([{ name: 'Boojum', location: 'Belfast', category: 'Burrito', description: 'Yummy Burritos' }, { name: 'Winterfell', location: 'The North', category: 'Cold', description: 'Fuck D&D' }])

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = JSON.parse(open(url).read)
response["venues"].each do |venue|
  Venue.create!(location: venue["strIngredient1"])
end
