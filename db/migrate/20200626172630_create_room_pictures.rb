class CreateRoomPictures < ActiveRecord::Migration
  def up
    create_table :room_pictures do |t|
      t.integer :room_id
      t.string :link_to
      t.timestamps
  end

  def down
  end
end
