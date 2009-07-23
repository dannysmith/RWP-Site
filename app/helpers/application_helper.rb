# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  #Converts an Integer price in pennies into a nicely formatted string.
  def to_price(number)
    number_to_currency((number.to_f)/100, :delimiter => ",", :unit => "&pound;",:separator => ".")
  end

end
