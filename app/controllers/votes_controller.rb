class VotesController < ApplicationController
  def create
    if current_user
      current_user.votes.create(vote_params)
      redirect_to "/links", notice: "Your vote has been counted!"
    else
      flash[:notice] = "You must log in or create an account to vote."
      redirect_to root_path
    end
  end

private

  def vote_params
    params.require(:vote).permit(:link_id)
  end
end