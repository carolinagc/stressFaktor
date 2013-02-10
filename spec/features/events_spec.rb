require 'spec_helper'

  describe "GET /events" do
    before do
      create_sample_locations
      create_sample_events
      create_sample_event_types
      create_sample_categories
    end
pending    it "display events index" do
      visit events_path
      save_and_open_page
#      page.should have_content("Cool event ever")
#      page.should have_content("Come and see")
    end
 end
 
  describe "POST /events" do

    before do
      create_sample_locations
      create_sample_events
      create_sample_event_types
      create_sample_categories
    end



pending    it "Create an event" do
      visit events_path
      click_link "New Event"
      save_and_open_page
      fill_in "event_description_attributes_name", :with  => "Conference"
      fill_in "event_description_attributes_description", :with  => "RailsGirls Conf"
      fill_in "event_description_attributes_address", :with  => "Ohlauerstr. 25"
      fill_in "event_description_attributes_link", :with  => "http://lala.com"
      fill_in "event_description_attributes_email", :with  => "lala@lala.com"
      select 'Kino', :from => "event_event_type_id"
      click_button "Create Event"
      page.should have_content("Event was successfully created.")

    end

    
pending    it "Update an event" do
      visit events_path
      visit "/events/1"      
      click_link "Edit"
      fill_in "event_title", :with  => "Show"
      fill_in "event_description", :with  => "A coooool show"
      click_button "Update Event" 
      page.should have_content("Event was successfully updated.")
    end
  end


