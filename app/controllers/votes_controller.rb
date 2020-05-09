require 'pry'
class VotesController < ApplicationController

    def create 
         #binding.pry
        vote = Vote.create(user_id: vote_params[:user_id], comment: params[:vote][:comment], topic_id: vote_params[:topic_id], opinion: params[:vote][:opinion])
        redirect_to user_path(vote.user)#, notice: alert
    end 
    def edit
        @vote = Vote.find_by(id: params[:id])

    end 
    def update
        @vote = Vote.find_by(id: params[:id])
     
        @topic = Topic.find_by(id: params[:vote][:topic_id])
        @vote.update(comment: params[:vote][:comment], opinion: params[:vote][:opinion])
        redirect_to topic_path(@topic)

    end 
    private

    def vote_params
        params.require(:vote).permit(:user_id, :topic_id)
    end 

end

