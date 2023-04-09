class AddNameToVenue < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :name, :string
  end
end
