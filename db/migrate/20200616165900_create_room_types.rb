class CreateRoomTypes < ActiveRecord::Migration
  def up
    create_table :room_types do |t|
      t.string :title
      t.text :description
    end
  end

  def down
  end
end
