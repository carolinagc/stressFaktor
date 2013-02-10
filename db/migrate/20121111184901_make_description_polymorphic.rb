class MakeDescriptionPolymorphic < ActiveRecord::Migration
  def up
    add_column :descriptions, :descriptable_type, :string
    add_column :descriptions, :descriptable_id, :integer
  end

  def down
    remove_column :descriptions, :descriptable_type
    remove_column :descriptions, :descriptable_id

  end
end
