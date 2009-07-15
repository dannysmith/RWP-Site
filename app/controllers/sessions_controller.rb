class SessionsController < ApplicationController
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      user.number_of_logins += 1; user.save!

      if user.number_of_logins < 2
        flash[:notice] = "Welcome to RWP! You can now browse our site for goodies."
      else
        flash[:notice] = "You are now logged in."
      end
      redirect_to root_url
    else
      flash.now[:error] = "Sorry, Invalid login or password."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end
end
