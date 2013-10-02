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


private

  def link_params
    params.require(:link).permit(:url, :short_description)
    # params.require(:vote).permit(:link_id)
  end
end