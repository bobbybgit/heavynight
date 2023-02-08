class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.integer :capacity
      t.references :location, null: false, foreign_key: true
      t.boolean :private

      t.timestamps
    end
  end
end
