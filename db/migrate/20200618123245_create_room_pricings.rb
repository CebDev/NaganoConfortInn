class CreateRoomPricings < ActiveRecord::Migration
  def up
    create_table :room_pricings do |t|
      t.string :title
      t.integer :room_type_id
      t.integer :room_view_id
      t.float :price_open_day
      t.float :price_week_end
      t.timestamp :date_from
      t.timestamp :date_to
      t.timestamp :archived_at
    end
  end

  def down
  end
end
