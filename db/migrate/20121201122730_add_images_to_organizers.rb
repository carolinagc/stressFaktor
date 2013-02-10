class AddImagesToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :image, :string
  end
end
