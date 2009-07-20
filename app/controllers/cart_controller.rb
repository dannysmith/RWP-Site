class CartController < ApplicationController
  
  #GET /cart
  def index
      @cart = find_cart
  end

end
