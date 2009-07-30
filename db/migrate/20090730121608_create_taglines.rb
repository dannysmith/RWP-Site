class CreateTaglines < ActiveRecord::Migration
  def self.up
    create_table :taglines do |t|
      t.string :tagline
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :taglines
  end
end
