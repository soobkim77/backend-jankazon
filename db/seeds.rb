# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Purchase.destroy_all
Item.destroy_all
User.destroy_all

# Seeding Users
puts "Creating Users"
5.times do
    User.create(username: Faker::Name.first_name, password_digest: "1234")
end

# Seeding Items
condition = ["used", "new", "worn"]
puts "Creating Items"
50.times do
    Item.create(name: Faker::Commerce.product_name, image_url: Faker::LoremFlickr.image, user: User.all.sample,  description: Faker::Lorem.sentence, price: Faker::Commerce.price)
end