class AddUserInformation < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
        t.string  :first_name
        t.string  :surname
        t.string  :phone
        t.string  :company_name
        t.integer :number_of_logins,  :default => 0
        t.boolean :admin,             :default => false
        t.string  :address1
        t.string  :address2
        t.string  :city
        t.string  :postcode
        t.string  :country
      end
  end

  def self.down
    change_table :users do |t|
        t.remove  :first_name
        t.remove  :surname
        t.remove  :phone
        t.remove  :company_name
        t.remove :number_of_logins
        t.remove :admin
        t.remove  :address1
        t.remove  :address2
        t.remove  :city
        t.remove  :postcode
        t.remove  :country
      end
  end
end
