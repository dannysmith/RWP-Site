class CartController < ApplicationController
  
  #GET /cart
  def index
      @cart = find_cart
  end

  def empty_cart 
    session[:cart] = nil 
    flash[:notice] = "Your cart is currently empty" 
    redirect_to :action => 'index' 
  end
  
  def confirm
    #debugger
    unless logged_in?
      flash[:notice] = "Please login to make an order."
      session[:last_page_viewed] = request.env['REQUEST_PATH']
      redirect_to :login
    else
      @cart = find_cart
    end
  end
end
