class UsersController < ApplicationController
  
  before_filter :login_required, :except => [:new, :create, :destroy]
  before_filter :admin_required, :only => :destroy
  
  #Lists the users for administration purposes. ADMIN ONLY
  def index
    @users = User.find(:all, :order => 'surname asc')
  end
  
  def show
    redirect_to :back
  end
  
  #Both new & create deal with adding new Users
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.username = @user.email
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to "/account"
    else
      render :new
    end
  end
  
  #Both edit & update deal with adding new Users
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated your details!"
      redirect_to "/account"
    else
      render :edit
    end
  end
  
  #Deals with destroying a user.
  def destroy
    @user = User.find(params[:id])
    debugger
    @user.destroy
    flash[:notice] = "Successfully destroyed record for  #{@user.first_name} #{@user.surname}."
    redirect_to :back
  end
end
