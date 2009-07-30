class TaglinesController < ApplicationController
  
  before_filter :admin_required, :except => :index
  
  def index
    @taglines = Tagline.all
  end
  
  def edit
    @tagline = Tagline.find(params[:id])
  end
  
  def update
    @tagline = Tagline.find(params[:id])
    if @tagline.update_attributes(params[:tagline])
      flash[:notice] = "Successfully updated tagline."
      redirect_to @tagline
    else
      render :action => 'edit'
    end
  end
end
