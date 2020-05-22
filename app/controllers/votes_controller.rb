
class VotesController < ApplicationController

    def create         
         vote = Vote.create(user_id: vote_params[:user_id], comment: params[:vote][:comment], topic_id: vote_params[:topic_id], opinion: params[:vote][:opinion])
        # Redirects the browser to the target specified in options. This parameter can be any one of:   
        redirect_to user_path(session["current_user"]["id"])
    end 
    def edit
    #  use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods
        @vote = Vote.where(id: params[:id]).take
        
    end 
    def update
        # Finds the first record matching the specified conditions. 
        #  There is no implied ordering so if order matters, you should specify it yourself.
        @vote = Vote.where(id: params[:id]).take  
        @topic = Topic.where(id: params[:vote][:topic_id]).take
        # Use update to change an attribute, check the validations and persist the change if validations pass.
        @vote.update(comment: params[:vote][:comment], opinion: params[:vote][:opinion])
        # Redirects the browser to the target specified in options. This parameter can be any one of:
        redirect_to topic_path(@topic)

    end 

        
  # The keyword private tells Ruby that all methods defined from now on, are supposed to be private. 
  #   They can be called from within the object (from other methods that the class defines), but not from outside.
    private

    def vote_params
        params.require(:vote).permit(:user_id, :topic_id)
    end 

end

