class AddFirstNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :profile_image, :string
    add_column :users, :site_admin, :boolean
  end
end
