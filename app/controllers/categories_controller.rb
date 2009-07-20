class CategoriesController < ApplicationController
  
  before_filter :admin_required, :except => [:index, :show]
  
  #GET /users
  def index
    @categories = Category.all
  end
  
  #GET /users/1
  def show
    @category = Category.find(params[:id])
  end
  
  #GET /users/new
  def new
    @category = Category.new
  end
  
  #POST /users
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Created new category, #{@category.name}."
      redirect_to :categories
    else
      render :action => 'new'
    end
  end
  
  #GET /users/1/edit
  def edit
    @category = Category.find(params[:id])
  end
  
  #PUT /users/1
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Saved!"
      redirect_to @category
    else
      render :action => 'edit'
    end
  end
  
  #DELETE /users/1
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Destroyed!"
    redirect_to categories_url
  end
  

end
