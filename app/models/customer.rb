class Customer < ActiveRecord::Base
    has_many :orders
    has_many :products, through: :orders

    def cancel_order(order)
        # thing = self.customers.find_by_order_id(order.id)
        # if thing
        #     order.status = cancelled
        end
    end

    def total_spent
    end
end