class UpdateAdminDefaultToMemberships < ActiveRecord::Migration[7.0]
  def change
    change_column_default :memberships, :admin, false
  end
end
