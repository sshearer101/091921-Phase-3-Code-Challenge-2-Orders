# Phase 3 Code Challenge: Product Orders

For this assignment, we'll be working with an e-commerce domain again. We'll be
focusing on the actual product orders themselves.

We have three models: `Customer`, `Order`, and `Product`.

A `Product` has many `Customers`s, and a `Customer` has many `Product`s, so 
`Product` >-< `Customer` is a many-to-many relationship. Each `Order` belongs to a 
`Customer` and to a `Product`, so `Product` --< `Order` and `Customer` --< `Order`
are one-to-many relationships.

`Product --< Order >-- Customer` 

**Note**: You should draw your domain on paper or on a whiteboard _before you
start coding_. Remember to identify a single source of truth for your data.

## Topics

- Active Record Migrations
- Active Record Associations
- Class and Instance Methods
- Active Record Querying

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec`
and you cannot run `learn`. You'll need to create your own sample instances so
that you can try out your code on your own. Make sure your associations and
methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it,
run `rake console` from the command line. This will start a `pry` session with
your classes defined. You can test out the methods that you write here. You are
also encouraged to use the `seeds.rb` file to create sample data to test your
models and associations.

Writing error-free code is more important than completing all of the
deliverables listed - prioritize writing methods that work over writing more
methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First,
prioritize getting things working. Then, if there is time at the end, refactor
your code to adhere to best practices.

**Before you submit!** Save and run your code to verify that it works as you
expect. If you have any methods that are not working yet, feel free to leave
comments describing your progress.

## What You Already Have

The starter code has migrations and models for the initial `Customer` and `Product`
models, and seed data for some `Customer`s and `Product`s. The schema currently
looks like this:

#### customers Table

| Column | Type   |
| ------ | ------ |
| name   | String |

#### products Table

| Column | Type    |
| ------ | ------- |
| name   | String  |
| price  | Integer |

You will need to create the migration for the `orders` table using the
attributes specified in the deliverables below. When you are done, the `orders`
table should look like this:

#### orders Table
| Column | Type   |
| ------ | ------ |
| status | String |
| num_items | Integer |
| delivered | Boolean |

## Deliverables

Write the following methods in the classes in the files provided. Feel free to
build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class
methods.

Remember: Active Record gives your classes access to a lot of methods already!
Keep in mind what methods Active Record gives you access to on each of your
classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a
migration for the `orders` table.

- An `Order` belongs to a `Product`, and an `Order` also belongs to a `Customer`. In
  your migration, create any columns your `orders` table will need to establish
  these relationships.
- The `orders` table should also have:
  - A `num_items` column that stores an integer.
  - A `status` column that stores a string. The default status when an order is created is "ordered".
  - A `delivered` column that stores a boolean.

After creating and running your migration, create your `Order` class, and use
the `seeds.rb` file to create `Order` instances so you can test your code.

**Once you've set up your `orders` table**, work on building out the following
deliverables.

### Object Association Methods

Use Active Record association macros and Active Record query methods where
appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Order

- `Order#customer`
  - returns the `Customer` instance for this Order
- `Order#product`
  - returns the `Product` instance for this Order

#### Product

- `Product#orders`
  - returns a collection of all the Orders for the Product
- `Product#customers`
  - returns a collection of all the Customers who ordered the Product

#### Customer

- `Customer#orders`
  - returns a collection of all the Orders that the Customer has made
- `Customer#products`
  - returns a collection of all the Products that the Customer has ordered

Use `rake console` and check that these methods work before proceeding. For
example, you should be able to call `Customer.first.products` and see a list of the
products for the first customer in the database based on your seed data; and
`Order.first.customer` should return the customer for the first order in the database.

### Aggregate and Association Methods

#### Order

- `Order#total_price`
  - returns the total price of the Order, equal to the Order's `num_items` times the `Product#price`
- `Order#print_invoice`
  - should `puts` to the terminal (not return!) a string formatted as follows: `Order for {insert name of product} ({insert number of items}) from {insert customer name}: ${insert order total_price}. Status: {insert order status}`
- `Order#deliver`
  - sets the `Order#delivered` attribute to `true` and the `Order#status` attribute to `"delivered"`

#### Product

- `Product#create_order(customer, num_items)`
  - takes a `Customer` (an instance of the `Customer` class) and a `num_items` (integer) as arguments, and creates a new `Order` in the database associated with this Product and Customer
- `Product#print_all_invoices`
  - should `puts` to the terminal (not return) a string representing each invoice for this product
  - each invoice should be formatted as follows:  `Order for {insert name of product} ({insert number of items}) from {insert customer name}: ${insert order total_price}. Status: {insert order status}`
- `Product#number_ordered`
  - returns an `integer` representing the total number of this product ordered, including delivered and cancelled orders. (Not necessarily the number of `Order` objects created!)
- `Product#volume`
  - returns an `integer` representing the total number of this product ordered, not including cancelled orders.

#### Customer

- `Customer#cancel_order(order)`
  - takes an `Order` object and sets the `Order#status` attribute to `cancelled`, only if that order belongs to the Customer. (Do not remove the order from the database.)
- `Customer#total_spent`
  - returns an `integer` representing the total amount spent by the Customer, not including cancelled orders.
