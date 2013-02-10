class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :link
      t.string :email

      t.timestamps
    end
  end
end
