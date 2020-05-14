require 'pry'
class TopicsController < ApplicationController

    def index 
        # biranding.pry
        @topics = Topic.all 
        @user = current_user
    end 

    def show 
            #binding.pry
           @topic = Topic.find_by(id: params[:id])
        #    @vote = Vote.all
           #  @vote = @topic.vote.build(user_id: current_user.id)
       @vote = Vote.new(user_id: session[:user]["id"], topic_id: @topic.id)
           @user = session[:user]
        #    @user_topics = []
       
        #    Topic.all.each do |n| 
         
        #    if n.user_id == current_user.id
        #     @user_topics << n
        #    end
    
        #    end
        #    @user_topics 

    end 

    def new
        
        @topic = Topic.new
       # binding.pry
    end 

    def create 
        #  binding.pry
        @topic = Topic.create(name: topic_params[:name], user_id: session[:user]["id"])
        redirect_to topic_path(@topic)

    end 

    def destroy
        @topic = Topic.find(params[:id])
        redirect_to user_path(@topic.user_id)
        
        @topic.destroy
       
      end

    private 
    def topic_params
        params.require(:topic).permit(:name) #, :tickets, :min_height, :nausea_rating, :happiness_rating
    end 

end


