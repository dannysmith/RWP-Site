class SiteController < ApplicationController
  
  before_filter :admin_required
  
  def index
  end
  
  def update
    if $site.update_attributes(params[:site])
      flash[:notice] = "Successfully updated settings."
      redirect_to settings_path
    else
      render :action => 'index'
    end
  end
  
end
