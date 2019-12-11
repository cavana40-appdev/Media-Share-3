class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :id, :uniqueness => true
end
