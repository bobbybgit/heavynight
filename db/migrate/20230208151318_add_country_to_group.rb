class AddCountryToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :country, :string
  end
end
