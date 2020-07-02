class RenameColumnInReservations < ActiveRecord::Migration
  def up
    rename_column :reservations, :user_id, :customer_id
  end

  def down
  end
end
