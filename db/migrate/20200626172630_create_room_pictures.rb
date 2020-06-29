class CreateRoomPictures < ActiveRecord::Migration
  def up
    create_table :room_pictures do |t|
      t.integer :room_id
      t.string :file_name
      t.timestamps
    end
  end

  def down
  end
end
