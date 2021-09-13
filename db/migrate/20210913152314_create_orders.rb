class CreateOrders < ActiveRecord::Migration[6.1]
  def change
   create_table :orders do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :num_items
      t.string :status
      t.boolean :delivered
   end
  end
end
