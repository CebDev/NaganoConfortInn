class CreateRooms < ActiveRecord::Migration
  def up
    create_table :rooms do |t|
      t.integer :number
      t.integer :floor
      t.integer :room_type_id
      t.integer :room_view_id
      t.integer :capacity
      t.string :status
      t.timestamp :archived_at
      t.timestamps
    end
  end

  def down
  end
end
