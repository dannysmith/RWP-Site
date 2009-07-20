class CartController < ApplicationController
  def index
      @cart = find_cart
  end

end
