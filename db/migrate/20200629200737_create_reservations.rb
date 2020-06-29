class CreateReservations < ActiveRecord::Migration
  def up
    create_table :reservations do |t|
      t.integer :user_id
      t.text :comment
      t.float :total_price
      t.timestamps
    end
  end

  def down
  end
end
