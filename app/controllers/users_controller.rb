class UsersController < ApplicationController
  
  before_filter :login_required, :except => [:new, :create, :destroy]
  before_filter :admin_required, :only => [:destroy, :index]
  
  #Lists the users for administration purposes. ADMIN ONLY
  def index
    @users = User.find(:all, :order => 'surname asc')
    respond_to do |format|
      format.html # index.html.haml
      format.xls  # Excel Export
      format.xml  { render :xml => @users }
    end
  end
  
  def show
    redirect_to account_url
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
      flash[:notice] = "Thank you for signing up! An email confirming your details has been sent and you are now logged in.\n\n#{$site.new_user_message}"
      SignupMailer.deliver_confirm(@user)
      email = SignupMailer.deliver_confirm_to_rwp(@user)
      logger.debug "Mail has been sent"
      #render(:text => "<pre>" + email.encoded + "</pre>") 
      redirect_to session[:last_page_viewed] || account_url
    else
      render :new
    end
  end
  
  #Both edit & update deal with changing Users
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated your details!"
      redirect_to :back || account_url
    else
      render :edit
    end
  end
  
  #Deals with destroying a user.
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed record for  #{@user.first_name} #{@user.surname}."
    redirect_to :back || root_url
  end
end
