class AddArchivedToRatePeriods < ActiveRecord::Migration
  def change
    add_column :rate_periods, :archived, :boolean, default: false
  end
end
