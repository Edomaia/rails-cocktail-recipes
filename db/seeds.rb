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

puts "Creating Cocktails.."

file = URI.open('https://images.unsplash.com/photo-1541546006121-5c3bc5e8c7b9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8cGlzY28lMjBzb3VyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60')
cocktail = Cocktail.new(name: 'Pisco Sour')
cocktail.photo.attach(io: file, filename: 'Pisco.png', content_type: 'image/png')
cocktail.save!

file = URI.open('https://images.unsplash.com/photo-1542849187-5ec6ea5e6a27?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8bmVncm9uaXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60')
cocktail = Cocktail.new(name: 'Negroni')
cocktail.photo.attach(io: file, filename: 'Negroni.png', content_type: 'image/png')
cocktail.save!

puts "Cocktail created."
