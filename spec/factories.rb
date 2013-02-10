
def create_sample_events
      event = Event.create(:date => "10-02-2013", :time => "13:00", :location_id => "1")
      event.build_description(:name => "Cool event ever", 
                              :address => "Veteranstr. 111 ",
                              :link => "http://lala.com",
                              :email => "lala@lala.com",
                              :description => "Come and see")
      event.save 

end

def create_sample_locations
      location = Location.new
      location.build_description(:name => "SO36", 
                                 :address => "Ohlauerstr. 21 ",
                                 :link => "http://stressfaktor.squat.net",
                                 :email => "lala@lala.com",
                                 :description => "blabla")
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
