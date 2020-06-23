class CreateReservationRooms < ActiveRecord::Migration
  def up
    create_table :reservation_rooms do |t|
      t.integer :reservation_id
      t.integer :room_id
      t.date :date_from
      t.date :date_to
      t.integer :room_pricing_id
      t.timestamps
    end
  end

  def down
  end
end
