# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

puts "Cleaning database..."
# DEPENDENT destroys the rest?
Look.destroy_all
Outfit.destroy_all
User.destroy_all

# shall we also destroy_all tables de jointures and potentially subcategory & category (4 more tables)?

puts "Creating users attributes..."
user_1 = {first_name: "Lara", last_name: "ElK", address: "33 rue de Lancry, 75010 Paris", email: "laraelk@gmail.com", password: "chocolate"}
user_2 = {first_name: "Joana", last_name: "Lps", address: "38 rue du château d'eau, 75010 Paris", email: "joanalps@icloud.fr", password: "chocolate"}
user_3 = {first_name: "Noémie", last_name: "Dlx", address: "80 avenue des Champs-Elysées, 75008 Paris", email: "noedlx@icloud.fr", password: "chocolate"}

puts "Fetching users profiles pictures..."

user_img_1 = 'https://media.istockphoto.com/id/1372281808/fr/photo/profil-du-visage-de-la-femme-portrait-de-jeune-fille-avec-une-peau-lisse-et-saine-mod%C3%A8le.jpg?s=612x612&w=0&k=20&c=q1yuhsE2Ma7YFpobO7oqIMmzqnMdFeaC1gF7keCEPBU='
user_img_2 = 'https://i.pinimg.com/736x/d5/59/bd/d559bd5ffda47d35f8d5ce8de8d6f325.jpg'
user_img_3 = 'https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHNob3J0JTIwaGFpciUyMGdpcmx8ZW58MHx8MHx8fDA%3D'

user_images = [ user_img_1, user_img_2,  user_img_3 ]

user_image_index = 0

puts 'Creating users...'
[user_1, user_2, user_3].each do |attributes|
  user = User.new(attributes)
  file = URI.open(user_images[user_image_index])
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: "image/png")
  user.save!
  user_image_index += 1
  puts "Created #{user.first_name}"
end
puts "Finished with users!"

puts 'Fetching images for looks inspirations...'
look_1_img = "https://www.taaora.fr/blog/wp-content/uploads/2022/11/tenue-hiver-femme-total-look-beige.jpg"
look_2_img = "https://archzine.fr/wp-content/uploads/2022/12/tenue-monochrome-noire-avec-manteau-tres-long-et-baskets-blancs.webp"
look_3_img = "https://archzine.fr/wp-content/uploads/2019/11/jeans-fonce%CC%81s-slim-bottines-velours-noir-pull-over-noir-look-total-noir-avec-manteau-femme-hiver-2020-couleur-lie-de-vin-sac-noir-cuir.jpg"

images = [look_1_img, look_2_img, look_3_img]
image_index = 0

puts 'Creating looks inspirations...'
3.times do
    look = Look.new()
    file = URI.open(images[image_index])
    look.photo.attach(io: file, filename: "#{look.id}.png", content_type: "image/png")
    image_index += 1
    look.save!
    puts "Created Look #{look.id}"
  end
