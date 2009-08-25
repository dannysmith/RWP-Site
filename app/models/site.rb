class Site < ActiveRecord::Base
  #Stores site-wide config options in the database.
  has_many :pages
  has_one :product, :foreign_key => :offer_product_1_id
  has_one :product, :foreign_key => :offer_product_2_id
  has_one :product, :foreign_key => :offer_product_3_id
  
  def active_pages
    self.pages.find(:all, :conditions => {:disabled => false})
  end
  
  def inactive_pages
    self.pages.find(:all, :conditions => {:disabled => true})
  end
  
  #Creates an array of the three offer products. This is crap code. TODO
  def offer_products
    list = []
    list << Product.find(self.offer_product_1_id)
    list << Product.find(self.offer_product_2_id)
    list << Product.find(self.offer_product_3_id)
  end
end
