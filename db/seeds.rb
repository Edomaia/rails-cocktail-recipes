require 'open-uri'

puts "Destroying reviews.."
Review.destroy_all if Rails.env.development?

puts "Destroying doses.."
Dose.destroy_all if Rails.env.development?

puts "Destroying ingredients.."
Ingredient.destroy_all if Rails.env.development?

puts "Destroying Cocktails.."
Cocktail.destroy_all if Rails.env.development?

puts "Creating ingredients.."
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

puts "Creating Cocktails"

5.times do |c|
  Cocktail.create([{ name: "Espresso Martini"},
                   { name: "Boulevardier"},
                   { name: "Peach Please"},
                   { name: "Negroni"}])
end
