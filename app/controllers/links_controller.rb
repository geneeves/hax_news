class LinksController < ApplicationController
  before_action :redirect_guest_users, :only => [:new, :create, :show]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.create(link_params)
    if @link.save
      redirect_to '/links', notice: "Your link has been posted!"
    else
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
    @comments = Comment.where(:commentable_id => params[:commentable_id])
    @comment = Comment.new(:commentable_id => params[:id], :commentable_type => "Link", :user_id => current_user.id)
  end

private

  def link_params
    params.require(:link).permit(:url, :short_description)
  end

  def redirect_guest_users
    unless current_user
      flash[:alert] = "You need to create an account to do that."
      redirect_to new_user_path
    end
  end
end
