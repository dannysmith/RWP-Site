class SiteController < ApplicationController
  
  before_filter :admin_required
  
  def index
  end
  
  def update
    #Allows pages to be disabled from a central location in the site settings.    
    if $site.update_attributes(params[:site])
      flash[:notice] = "Successfully updated settings."
      redirect_to settings_path
    else
      render :action => 'index'
    end
  end
  
end
