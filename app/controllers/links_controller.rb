class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
    if @link.save
      redirect_to '/links', notice: "Your link has been posted!"
    else
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    @comments = Comment.where(:commentable_id => params[:commentable_id])
    @comment = Comment.new(:commentable_id => params[:id], :commentable_type => "Link")
  end


private

  def link_params
    params.require(:link).permit(:url, :short_description)
    params.require(:vote).permit(:link_id)
  end
end