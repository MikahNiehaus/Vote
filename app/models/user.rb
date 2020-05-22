class User < ActiveRecord::Base
    # Adds methods to set and authenticate against a BCrypt password. 
    #   This mechanism requires you to have a XXX_digest attribute. Where XXX is the attribute name of your desired password.
     has_secure_password

    #  Validations are used to ensure that only valid data is saved into your database. 
  #  Model-level validations are the best way to 
  # ensure that only valid data is saved into your database. They are database agnostic, cannot 
  #   be bypassed by end users, and are convenient to test and maintain.
     validates :name, presence: true
     validates :password, presence: true
     validates :name, uniqueness: {
        scope: [:name],
        # session["error_message"] = "Cannot release the same name twice."
      }
    # has_many association indicates a one-to-many connection with another model. 
    has_many :votes

    # A has_many :through association is often used to set up a many-to-many connection with another model.
    #   This association indicates that the declaring model can be matched with zero or more instances of another model 
    #   by proceeding through a third model
    has_many :topics, through: :votes

  
end
