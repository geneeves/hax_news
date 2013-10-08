class VotesController < ApplicationController
  def create
    current_user.votes.create(vote_params)
    redirect_to "/links", notice: "Your vote has been counted!"
  end

private

  def vote_params
    params.require(:vote).permit(:link_id)
  end
end