class Topic < ApplicationRecord
    # A has_many association indicates a one-to-many connection with another model. 
    has_many :votes
    
    # A has_many :through association is often used to set up a many-to-many connection with another model.
    #   This association indicates that the declaring model can be matched with zero or more instances of another model 
    #   by proceeding through a third model
    has_many :users,  through: :votes
end
