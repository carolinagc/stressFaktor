class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :capacity

      t.timestamps
    end
  end
end
