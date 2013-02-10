class Category < ActiveRecord::Base
  attr_accessible :name, :position
  has_and_belongs_to_many :events 
end
