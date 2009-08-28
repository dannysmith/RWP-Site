class PriceOption < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :option
  validates_presence_of :price
  validates_numericality_of :price,
                            :on       => :create,
                            :message  => "must be a whole number (in pennies)"
                            
  def price_and_name
    "#{self.option} - #{to_price(self.price)}"
  end
  
private
  def to_price(number)
    (number/100.0).to_currency( :delimiter => ",", :unit => "£",:separator => ".")
  end
end
