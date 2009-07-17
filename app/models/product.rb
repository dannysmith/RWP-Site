class Product < ActiveRecord::Base
  belongs_to :category
  
  has_attached_file :photo, :styles => { :small => "200x200>", :thumbnail => "100x100>", :normal => "250x250>"}
end
