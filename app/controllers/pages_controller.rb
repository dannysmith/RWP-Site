class PagesController < ApplicationController
  
  def show
    @page = Page.find_by_name(params[:name])
    #@page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Updated #{@page.title} page, OK."
      redirect_to "/#{@page.name}"
    else
      render :action => 'edit'
    end
  end
  
  def edit
    @page = Page.find_by_name(params[:name])
  end
end
