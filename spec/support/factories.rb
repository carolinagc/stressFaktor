
def create_sample_events
      event = Event.create(:date => "10-02-2013", :time => "13:00")
      event.build_description(:name => "Cool event ever", :description => "Come and see")
      event.save 

end

def create_sample_locations
      location = Location.new
      location.build_description(:address => "Ohlauerstr. 21 ", :link => "stressfaktor.squat.net", :description => "blabla")
      location.save 
end

def create_sample_event_types

  EventType.create(:name => "Ausstellung")
  EventType.create(:name => "Konzert")
  EventType.create(:name => "Kino")


end

def create_sample_categories

  Category.create(:name => "Migration")
  Category.create(:name => "Technology")


end
