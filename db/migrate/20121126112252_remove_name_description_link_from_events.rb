class RemoveNameDescriptionLinkFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :name
    remove_column :events, :description
    remove_column :events, :link
  end

  def down
    add_column :events, :name, :string
    add_column :events, :description, :string
    add_column :events, :link, :string

  end
end
