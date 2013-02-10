class RemoveTimestampsFromCategoriesEvents < ActiveRecord::Migration
  def up
    remove_column :categories_events, :created_at
    remove_column :categories_events, :updated_at
  end

  def down
    add_column :categories_events, :created_at, :datetime
    add_column :categories_events, :updated_at, :datetime

  end
end
