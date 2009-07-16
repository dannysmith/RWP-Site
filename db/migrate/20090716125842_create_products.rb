class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :offer_price
      t.boolean :disabled
      t.timestamps
    end
  end
  
  def self.down
    drop_table :products
  end
end
