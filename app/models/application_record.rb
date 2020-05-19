class ApplicationRecord < ActiveRecord::Base
  # Returns whether this class is an abstract class or not
  self.abstract_class = true
end
