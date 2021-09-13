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
order1 = Order.create(num_items: 10, status: "On the way!", product_id: product1.id, customer_id: customer1.id, delivered: true)
order2 = Order.create(num_items: 5, status: "Held up!", product_id: product2.id, customer_id: customer1.id, delivered: false)
order3 = Order.create(num_items: 1, status: "Delivered!", product_id: product3.id, customer_id: customer1.id, delivered: true)


puts "Seeding done!"
puts

puts order1.num_items
puts order2.status
puts order3.delivered

puts
puts "total price"
puts order1.total_price
puts

puts "print invoice"
puts order1.print_invoice

puts
puts "deliver"
puts order1.deliver
puts order2.deliver
puts order3.deliver


puts 
order4 = Order.create(num_items: 3, status: "other", product_id: product1.id, customer_id: customer1.id, delivered: false)
puts "all invoices"
puts product1.print_all_invoices
puts

puts "number ordered"
puts product1.number_ordered
puts

# puts "volume"
# puts product1.volume


# puts "cancel order"
# puts customer1.cancel_order(product1)