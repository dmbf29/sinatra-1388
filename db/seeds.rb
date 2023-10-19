# create some restaurants to see in our app
require 'faker'
puts "Cleaning the db..."
Restaurant.destroy_all

puts 'Creating restaurants...'
# This is where you can create initial data for your app.
20.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address
  )
  restaurant.save
end
puts "... created #{Restaurant.count} restaurants."
