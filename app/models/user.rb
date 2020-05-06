class User < ActiveRecord::Base
     has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood 
        # binding.pry
        if self.admin == false
            if self.nausea > self.happiness 
                mood = "sad"
            else 
                mood = "happy"
            end 
        end 
    end 


end
