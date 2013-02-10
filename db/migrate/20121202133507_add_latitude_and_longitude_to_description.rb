class AddLatitudeAndLongitudeToDescription < ActiveRecord::Migration
  def change
    add_column :descriptions, :latitude, :float
    add_column :descriptions, :longitude, :float
  end
end
