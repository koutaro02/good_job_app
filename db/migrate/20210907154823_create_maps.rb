class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.string :title, null: false
      t.text :address
      t.float :latitude
      t.float :longitude
      t.text :content
      t.timestamps
    end
  end
end
