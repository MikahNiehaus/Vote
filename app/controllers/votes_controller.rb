class VotesController < ApplicationController

    def create 
        vote = Vote.create(vote_params)

        alert = vote.take_vote
        # binding.pry

        redirect_to user_path(vote.user), notice: alert
    end 

    private

    def vote_params
        params.require(:vote).permit(:user_id, :attraction_id)
    end 

end

