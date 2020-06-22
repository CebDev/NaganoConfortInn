class ChangeRoomDefaultStatus < ActiveRecord::Migration
  def up
    change_column_default :rooms, :status, "Ready"
  end

  def down
  end
end
