class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.references :game, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :slot_number
      t.integer :max_slots

      t.timestamps
    end
  end
end
