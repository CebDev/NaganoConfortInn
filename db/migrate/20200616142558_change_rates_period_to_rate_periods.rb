class ChangeRatesPeriodToRatePeriods < ActiveRecord::Migration
  def up
    rename_table :rates_period, :rate_periods
  end

  def down
  end
end
