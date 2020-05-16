class User < ActiveRecord::Base
      has_secure_password
    has_many :votes
    has_many :topics, through: :votes




end
