class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.integer :order_id
      t.string :name
      t.datetime :date
      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
