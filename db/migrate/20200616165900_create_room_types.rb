class CreateRoomTypes < ActiveRecord::Migration
  def up
    create_table :room_types do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def down
  end
end
