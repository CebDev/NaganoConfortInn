class CreationRoomAdjacents < ActiveRecord::Migration
  def up
    create_table :room_adjacents do |t|
      t.integer :room_id
      t.integer :room_adjacent_id
    end
  end

  def down
  end
end
