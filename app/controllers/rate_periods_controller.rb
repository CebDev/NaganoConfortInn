class RatePeriodsController < ApplicationController
  def index
    @title = "NCI Rate periods"
    @rate_periods = RatePeriod.all
  end
end
