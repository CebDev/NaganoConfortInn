class CreateRoomViews < ActiveRecord::Migration
  def up
    create_table :room_views do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def down
  end
end
