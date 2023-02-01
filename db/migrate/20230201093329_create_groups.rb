class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :city
      t.references :location, null: false, foreign_key: true
      t.text :description
      t.boolean :private
      t.references :event_setting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
