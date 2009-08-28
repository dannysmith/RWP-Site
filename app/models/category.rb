class Category < ActiveRecord::Base
  has_many :products
  validates_presence_of :name
  validates_uniqueness_of :name
  
  #Returns the first six products in a category.
  def products_for_home
    self.products.find( :all,
                        :order      => 'RANDOM()', 
                        :limit      => 6, 
                        :conditions => {:disabled => false})
  end

end
