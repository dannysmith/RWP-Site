class Cart
  attr_reader :items 
  
  def initialize 
    @items = [] 
  end
  
  def add_product(cart_item)
    @items << cart_item
  end
  
  def total_price 
    @items.sum { |item| item.price.to_i } 
  end
end 
