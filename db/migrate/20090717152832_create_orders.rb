class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :total
      t.integer :user_id
      t.timestamps
    end
        
    create_table :orders_products, :id => false do |t|  
      t.references :product
      t.references :order  
      t.timestamps
    end    
  end
  
  def self.down
    drop_table :orders
    drop_table :orders_products
  end
end
