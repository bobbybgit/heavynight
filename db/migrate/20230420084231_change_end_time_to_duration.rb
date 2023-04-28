class ChangeEndTimeToDuration < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :end_time, :integer
    rename_column :events, :end_time, :duration     
  end
end
