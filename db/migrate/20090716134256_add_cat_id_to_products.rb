class AddCatIdToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.integer :category_id
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :category_id
    end
  end
end
