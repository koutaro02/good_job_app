class CreateMapUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :map_users do |t|
      t.references :map, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
