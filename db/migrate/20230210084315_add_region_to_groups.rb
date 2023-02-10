class AddRegionToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :region, :string
  end
end
