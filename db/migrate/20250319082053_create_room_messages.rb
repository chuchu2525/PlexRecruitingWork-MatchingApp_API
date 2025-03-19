class CreateRoomMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :room_messages do |t|
      t.text :context
      t.string :sender_name
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
