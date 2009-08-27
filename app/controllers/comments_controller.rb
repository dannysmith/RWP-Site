class CommentsController < ApplicationController
  
  before_filter :login_required
  before_filter :admin_required, :only => [:delete]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment])
    flash[:notice] = "Successfully created comment!"
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Deleted"
    redirect_to :back
  end

end
