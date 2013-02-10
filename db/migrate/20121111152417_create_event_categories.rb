class CreateEventCategories < ActiveRecord::Migration
  def change
    create_table :event_categories do |t|
      t.integer :category_id
      t.integer :event_id

      t.timestamps
    end
  end
end
