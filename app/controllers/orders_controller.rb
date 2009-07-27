class OrdersController < ApplicationController
  
  before_filter :admin_required, :only => [:update, :edit, :destroy, :new]
  before_filter :login_required
  
  def index
    if logged_in_as_admin?
      @orders = Order.all
    else
      @orders = current_user.orders
    end
  end
  
  def show
    @order = order_for_cu
  end
  
  def new
    @order = Order.new
  end
  
  def create
    if logged_in_as_admin?
      #If the admin user is logged in, make the order using params - it's being created for someone else.
      @order = Order.new(params[:order])
    else
      #If a normal use is logged in, use the cart, they're doing it for themselves.
      @order = Order.new
      @order.user = current_user
      cart = find_cart
      cart.items.each {|item| @order.products << item.product}
      @order.total = cart.total_price
    end
    
    if @order.save
      email = OrderMailer.deliver_order(current_user)
      semail = OrderMailer.deliver_order_notice
      logger.debug "Mail has been sent"
      @order.status = "Awating Contact"
      flash[:notice] = "Successfully created order number #{@order.id}"
      #render(:text => "<pre>" + email.encoded + "</pre>" + "<hr />" + "<pre>" + semail.encoded + "</pre>")
      session[:cart] = nil #Empty Cart
      redirect_to orders_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    debugger
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:notice] = "Successfully updated order."
      redirect_to orders_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Successfully destroyed order."
    redirect_to orders_url
  end
  
private
  #Only returns the orders for the current user - used in the show method.
  def order_for_cu
    begin
        @order = current_user.orders.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        flash[:error] = "None of your orders have ID: #{params[:id]}"
        redirect_to root_url
    end
  end
  
end
