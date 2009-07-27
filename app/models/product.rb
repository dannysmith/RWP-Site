class Product < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :orders
  
  validates_presence_of :name, :description
  #validates_attachment_presence :photo
  
  has_attached_file :photo,
  :styles => {
    :thumb  => "80x80#",
    :small => "200x200>",
    :normal => "250x250>"
  },
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :path => ":attachment/:id/:style.:extension",
  :bucket => 'rwp-website'
end
