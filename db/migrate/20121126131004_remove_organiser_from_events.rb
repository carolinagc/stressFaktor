class RemoveOrganiserFromEvents < ActiveRecord::Migration
  def up
        remove_column :events, :organiser_id
  end

  def down
        add_column :events, :organiser_id, :integer
  end
end
