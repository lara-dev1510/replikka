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
require "csv"

puts "Cleaning database..."
# DEPENDENT destroys the rest?
Outfit.destroy_all
User.destroy_all
Piece.destroy_all
LookSubcategory.destroy_all
Subcategory.destroy_all
Category.destroy_all
Look.destroy_all

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

puts "Creating categories"

Category::CATEGORIES.each do |category_params|
  Category.create!(category_params)
end

puts "Finished with #{Category.count} categories"

# puts "Creating subcategories"

# Subcategory::ITEMS.each do |item|
#   Subcategory::COLORS.each do |color|
#     Subcategory::FABRICS.each do |fabric|
#       Subcategory.create(
#         name: item[:name],
#         category_id: Category.find_by_position(item[:position]).id,
#         color: color,
#         fabric: fabric[:name],
#         temperature_range: item[:temperature_range] ? item[:temperature_range] : fabric[:temperature_range]
#       )
#     end
#   end
# end

# puts "Finished with #{Subcategory.count} subcategories"

filepath_looks = "storage/looks_seed.csv"
filepath_pieces = "storage/pieces_seed.csv"
filepath_looks_subcategories = "storage/looks_subcategories_seed.csv"

CSV.foreach(filepath_looks, headers: :first_row) do |row|
  look = Look.create!
  file = URI.open(row['image'])
  look.photo.attach(io: file, filename: "look_#{look.id}.jpg", content_type: "image/jpeg")
  look.save
  puts "✅ Created Look #{look.id}"
end


CSV.foreach(filepath_looks_subcategories, headers: :first_row) do |row|
  item = Subcategory::ITEMS.find{ |item| item[:name] == row['item'] }
  fabric = Subcategory::FABRICS.find{ |item| item[:name] == row['fabric'] }
  subcategory = Subcategory.find_or_create_by(
    name: item[:name],
    category_id: Category.find_by_position(item[:position]).id,
    color: row['color'],
    fabric: fabric[:name],
    temperature_range: item[:temperature_range] ? item[:temperature_range] : fabric[:temperature_range]
  )
  LookSubcategory.create(subcategory: subcategory, look: Look.all[row['id'].to_i - 1])
  # puts "✅ Added subcategories to looks #{look_subcategory.id}"
end

CSV.foreach(filepath_pieces, headers: :first_row) do |row|
  item = Subcategory::ITEMS.find{ |item| item[:name] == row['item'] }
  fabric = Subcategory::FABRICS.find{ |item| item[:name] == row['fabric'] }
  subcategory = Subcategory.find_or_create_by(
    name: item[:name],
    category_id: Category.find_by_position(item[:position]).id,
    color: row['color'],
    fabric: fabric[:name],
    temperature_range: item[:temperature_range] ? item[:temperature_range] : fabric[:temperature_range]
  )
  piece = Piece.create(name: row['name'], user: User.first, subcategory: subcategory)
  file = URI.open(row['image'])
  piece.photo.attach(io: file, filename: "#{piece.name}.png", content_type: "image/jpeg")
  piece.save
  puts "✅ Created pieces with subcategories #{piece.id}"
end

@used_looks = []
day_counter = -1
user = User.find_by(first_name: "Lara")
@pieces = user.pieces

10.times do
  @look = (Look.all - @used_looks).sample
  @used_looks << @look
  @outfit = Outfit.new(confirmed: true, look_id: @look.id)
  # @selected_pieces = []
    if @outfit.save

      @potential_pieces = []
      # @subcategories = []
      @look.subcategories.each do |subcategory|
        # @subcategories << subcategory
        @pieces.each do |piece|
          if (piece.subcategory.color == subcategory.color && piece.subcategory.name == subcategory.name)
            @potential_pieces << piece
            # OutfitPiece.create(piece_id: piece.id, outfit_id: outfit.id)
          end
        end
      end

      # @potential_pieces.each do |selection|
        # @selected_pieces << selection.sample
      # end

      @potential_pieces.each do |piece|
      # @selected_pieces.each do |piece|
        @piece = Piece.find(piece.id)
        outfit_piece = OutfitPiece.new
        outfit_piece.piece = @piece
        outfit_piece.outfit = @outfit
        if outfit_piece.save
          @piece.update(worn_stat: @piece.worn_stat + 1 )
        end
      end
      @outfit.update(created_at: Date.today + day_counter, updated_at: Date.today  + day_counter)
      day_counter += -1
    end
  @outfit.save!
end
puts 'Finished creating outfits!'
