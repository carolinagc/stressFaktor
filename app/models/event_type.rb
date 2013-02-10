class EventType < ActiveRecord::Base
  attr_accessible :name, :event_type_id
  has_many :events

end
