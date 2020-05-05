require_relative '../lib/stdout_helpers'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUM_OF_USERS = 20
NUM_OF_PRODUCTS = 1000
NUM_OF_REVIEWS = 2
PASSWORD = 'supersecret'

Review.destroy_all()
Product.destroy_all()
User.destroy_all()

super_user = User.create(
  first_name: 'jon',
  last_name: 'snow',
  email: 'js@winterfell.gov',
  password: PASSWORD
)

NUM_OF_USERS.times do |x|
  u = User.create({
    first_name: Faker::Games::SuperSmashBros.fighter,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: PASSWORD
  })
  Stdout.progress_bar(NUM_OF_USERS, x, "█") { "Creating Users" }
end

users = User.all

NUM_OF_PRODUCTS.times do |x|
  created_at = Faker::Date.backward(days: 365)
  product = Product.create({
    title: "#{Faker::Cannabis.strain}-#{rand(1_000_000_000)}",
    description: Faker::Cannabis.health_benefit,
    price: rand(100_000),
    user: users.sample,
    created_at: created_at,
    updated_at: created_at
  })
  NUM_OF_REVIEWS.times do
    Review.create({
      rating: rand(1..5),
      body: Faker::Hacker.say_something_smart,
      product: product,
      user: users.sample
    })
  end
  Stdout.progress_bar(NUM_OF_PRODUCTS, x, "█") { "Creating Products with Reviews" }
end

products = Product.all
reviews = Review.all

puts Cowsay.say("Created #{products.count} products with #{NUM_OF_REVIEWS} reviews each!", :sheep)
puts Cowsay.say("Created #{users.count}  users!", :turtle)

