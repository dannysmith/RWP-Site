class CreatePriceOptions < ActiveRecord::Migration
  def self.up
    create_table :price_options do |t|
      t.string :option
      t.integer :price
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :price_options
  end
end
