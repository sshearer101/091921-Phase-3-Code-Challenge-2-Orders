class Customer < ActiveRecord::Base
    has_many :orders
    has_many :products, through: :orders

    # def cancel_order(order)
    #     thing = self.products.find_by_product_id(product.id)
    #     if thing
    #         order.status = cancelled
    #     end
    # end

    # def cancel_order(order)
    #     self.orders.filter{|r| r.order == order}
    #     :status = cancelled 
    # end

    def total_spent
       self.products.sum(:price)
    end
end