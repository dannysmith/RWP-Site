class CartItem

  attr_reader :product, :price_option
  
  def initialize(product, option)
    @product = product
    @price_option = option
  end
  
  def name
    @product.name
  end
  
  def price
    @price_option.price
  end
  
  def option
    @price_option.option
  end
end
