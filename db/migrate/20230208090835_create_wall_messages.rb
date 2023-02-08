class CreateWallMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :wall_messages do |t|
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
