class SessionsController < ApplicationController
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      user.number_of_logins += 1; user.save!

      if user.number_of_logins < 2
        flash[:notice] = "\n\n#{$site.new_user_message}"
      else
        flash[:notice] = "You are now logged in."
      end
      #If there is a last_page_viewed, go there because the user was half-way through something.
      redirect_to session[:last_page_viewed] || root_url

    else
      flash.now[:error] = "Sorry, Invalid login or password."
      render :new
    end
  end
  
  def destroy
    #Reset user ID and last page viewed when the user clicks to logout.
    session[:user_id] = nil
    session[:last_page_viewed] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end
end
