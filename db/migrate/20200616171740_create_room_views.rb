class CreateRoomViews < ActiveRecord::Migration
  def up
    create_table :room_views do |t|
      t.string :title
      t.text :description
    end
  end

  def down
  end
end
