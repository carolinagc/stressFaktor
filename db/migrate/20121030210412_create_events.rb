class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :description
      t.integer :location_id
      t.integer :event_type_id
      t.integer :organiser_id
      t.string :link

      t.timestamps
    end
  end
end
