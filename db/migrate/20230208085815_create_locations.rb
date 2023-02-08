class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :region
      t.string :country
      t.string :code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
