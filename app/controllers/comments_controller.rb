class CommentsController < ApplicationController
  before_action :redirect_guest_users, :only => [:new, :create]

  def new
    @comment = Comment.new(:commentable_id => params[:commentable_id], :commentable_type => params[:commentable_type])
    @comments = Comment.where(:commentable_id => params[:commentable_id])
  end

  def create
    if current_user
      @comments = Comment.where(:commentable_id => params[:commentable_id])
      @comment = current_user.comments.new(comment_params)
      if @comment.save
        redirect_to link_path(:id => @comment.link.id)
      else
        render :new
      end
    else
      flash[:alert] = "You must log in or create an account to do that."
      render new_user_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted."
    redirect_to link_path(:id => @comment.link.id)
  end

private
  
  def comment_params
    params.require(:comment).permit(:comment_text, :commentable_id, :commentable_type)
  end

  def redirect_guest_users
    unless current_user
      flash[:notice] = "You need to create an account to do that."
      redirect_to new_user_path
    end
  end
end
