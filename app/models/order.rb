class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :product

    def total_price
        Order.sum(num_items * product.price)
    end

    def print_invoice
        puts "#{product.name} from #{customer.name}: #{total_price}. Status: #{status}"
    end

    def deliver 
        if self.delivered = true
        self.status = "delivered"
        end
       
    end
end