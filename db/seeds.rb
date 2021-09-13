# This will delete any existing rows from the Product and Customer tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
Customer.destroy_all

puts "Creating Customers..."
customer1 = Customer.create(name: Faker::Name.name)
customer2 = Customer.create(name: Faker::Name.name)
customer3 = Customer.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating orders..."
# *****************************************************************
# * TODO: create orders! Remember, an order belongs to a product *
# * and an order belongs to a customer.                              *
# *****************************************************************
# Create Orders Here

puts "Seeding done!"