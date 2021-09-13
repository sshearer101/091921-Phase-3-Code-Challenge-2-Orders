class Product < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def create_order(customer, num_items)
        Order.create(customer: customer, num_items: num_items, customer_id: customer.id, product_id: self.id)
    end

    def print_all_invoices
        self.orders.each do |order|
            order.print_invoice
        end
    end

    def number_ordered
        self.orders.sum(:num_items)
      
    end

    def volume
        # self.orders.sum(:num_items - cancel_order)
    end

end