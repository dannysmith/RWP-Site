class CartItem

  attr_reader :product, :price
  
  def initialize(product, price)
    @product = product
    @price = price
  end
  
  def name
    @product.name
  end
  
end
