# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

ingredient_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_json = open(ingredient_url).read
ingredients = JSON.parse(ingredient_json)

puts 'Destroying all ingredients...'

Ingredient.destroy_all

puts 'Creating ingredients...'

ingredients["drinks"].each do |hash|
  Ingredient.create(
    name: hash["strIngredient1"]
  )
end

puts 'Creation of ingredients done!'


puts 'Destroying all cocktails...'

Cocktail.destroy_all

puts 'Creating cocktails...'

10.times do
  cocktail_url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
  cocktail_json = open(cocktail_url).read
  cocktail = JSON.parse(cocktail_json)

  Cocktail.create(
    name: cocktail['drinks'].first['strDrink'],
    image_url: cocktail['drinks'].first['strDrinkThumb']
  )
end

puts 'Creation of cocktails done!'
