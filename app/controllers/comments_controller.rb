class CommentsController < ApplicationController
  def new
    @comment = Comment.new(:link_id => params[:link_id])
    @comments = Comment.where("link_id =  ?", params[:link_id])
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
    params.require(:comment).permit(:comment_text, :link_id)
  end
end