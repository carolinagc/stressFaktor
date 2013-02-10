class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.integer :event_id

      t.timestamps
    end
  end
end
