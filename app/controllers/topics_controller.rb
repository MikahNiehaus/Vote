class TopicsController < ApplicationController

    def index 
        # binding.pry
        @topics = Topic.all 
        @user = current_user
    end 

    def show 
       #  binding.pry
        @topic = Topic.find_by(id: params[:id])
        @ride = @topic.rides.build(user_id: current_user.id)
        @user = current_user
    end 

    def new
        
        @topic = Topic.new
    end 

    def create 
        # binding.pry
        @topic = Topic.create(topic_params)
        redirect_to topic_path(@topic)

    end 

    def edit
        @topic = Topic.find_by(id: params[:id])

    end 

    def update
        @topic = Topic.find_by(id: params[:id])
        @topic.update(topic_params)
        redirect_to topic_path(@topic)

    end 

    private 
    def topic_params
        params.require(:topic).permit(:name) #, :tickets, :min_height, :nausea_rating, :happiness_rating
    end 

end

