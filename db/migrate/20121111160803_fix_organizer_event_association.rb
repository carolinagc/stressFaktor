class FixOrganizerEventAssociation < ActiveRecord::Migration
  def up
  	remove_column :organizers, :event_id
  	add_column :events, :organizer_id, :integer
  end

  def down
  	add_column :organizers, :event_id, :integer
  	remove_column :events, :organizer_id	
  end
end
