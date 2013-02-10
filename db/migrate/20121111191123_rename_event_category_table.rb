class RenameEventCategoryTable < ActiveRecord::Migration
  def up
    rename_table :event_categories, :categories_events
  end

  def down
    rename_table :categories_events, :event_categories
  end
end
