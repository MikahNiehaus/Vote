class User < ActiveRecord::Base
    # Adds methods to set and authenticate against a BCrypt password. 
    #   This mechanism requires you to have a XXX_digest attribute. Where XXX is the attribute name of your desired password.
     has_secure_password

    # has_many association indicates a one-to-many connection with another model. 
    has_many :votes

    # A has_many :through association is often used to set up a many-to-many connection with another model.
    #   This association indicates that the declaring model can be matched with zero or more instances of another model 
    #   by proceeding through a third model
    has_many :topics, through: :votes
end
