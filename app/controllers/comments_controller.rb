class CommentsController < ApplicationController
  def new
    @comment = Comment.new(:commentable_id => params[:commentable_id], :commentable_type => params[:commentable_type])
    @comments = Comment.where(:commentable_id => params[:commentable_id])
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to link_path(:id => @comment.link.id)
    else
      render :new
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
end