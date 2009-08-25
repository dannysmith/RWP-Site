class AddSpecialOferProductsToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :offer_product_1_id, :integer
    add_column :sites, :offer_product_2_id, :integer
    add_column :sites, :offer_product_3_id, :integer
  end

  def self.down
    remove_column :sites, :offer_product_1_id
    remove_column :sites, :offer_product_2_id
    remove_column :sites, :offer_product_3_id
  end
end
