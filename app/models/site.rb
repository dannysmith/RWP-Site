class Site < ActiveRecord::Base
  #Stores site-wide config options in the database.
  has_many :pages
  
  def active_pages
    self.pages.find(:all, :conditions => {:disabled => false})
  end
  
end
