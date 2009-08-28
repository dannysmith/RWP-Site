class Product < ActiveRecord::Base
  belongs_to :category
  has_many :price_options
  has_many :line_items
  
  validates_associated :category
  validates_presence_of :name,
                        :description
  #validates_attachment_presence :photo
  
  accepts_nested_attributes_for :price_options, 
                                :allow_destroy  => true,
                                :reject_if      => proc { |attrs| attrs.all? { |k, v| v.blank? }}
  
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
