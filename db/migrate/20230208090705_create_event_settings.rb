class CreateEventSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :event_settings do |t|
      t.references :group, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.integer :min_per_session
      t.integer :max_per_session
      t.float :max_weight
      t.float :min_weight
      t.integer :max_length
      t.integer :min_length
      t.boolean :use_rec_count

      t.timestamps
    end
  end
end
