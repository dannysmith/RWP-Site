class ProductsController < ApplicationController
  
  before_filter :admin_required, :except => [:index, :show, :add_to_cart]
  
  def index
    redirect_to :categories
  end
  
  def show
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound 
    invalid_product_call
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Successfully created product."
      redirect_to @product
    else
      render :action => 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_url
  end
  
  #Adds the product to the current cart.
  def add_to_cart
    product = Product.find(params[:id])
    cart_item = CartItem.new(product, params[:price])
    @cart = find_cart
    @cart.add_product(cart_item)
    flash[:notice] = "#{cart_item.product.name} has been added to your cart."
    #Update the shopping cart total shown on the right here!
    redirect_to product
  rescue ActiveRecord::RecordNotFound 
    invalid_product_call "Invalid product code! You can't ad this to the cart!"
  
  end
  
  private
  
    def invalid_product_call(msg = "Sorry, Invalid product code!")
      logger.error("Attempt to access invalid product #{params[:id]}") 
      flash[:notice] = msg 
      redirect_to :action => 'index'
    end
  
end
