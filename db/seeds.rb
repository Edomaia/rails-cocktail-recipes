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

# file = URI.open('https://res.cloudinary.com/dtulzuk5j/image/upload/v1613720039/qhkvtr0pfqsulvtmzvnf.jpg')
# cocktail = Cocktail.new(name: 'Espresso Martini')
# cocktail.photo.attach(io: file, filename: 'qhkvtr0pfqsulvtmzvnf.jpg', content_type: 'image/jpg')
# cocktail.save!

file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
cocktail = Cocktail.new(name: 'NES')
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
cocktail.save!
