class CommentsController < ApplicationController
  def new
    @comment = Comment.new(:commentable_id => params[:commentable_id], :commentable_type => params[:commentable_type])
    @comments = Comment.where("commentable_id =  ?", params[:commentable_id])
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to '/links'
    else
      render :new
    end
  end


private
  
  def comment_params
    params.require(:comment).permit(:comment_text, :commentable_id, :commentable_type)
  end
end