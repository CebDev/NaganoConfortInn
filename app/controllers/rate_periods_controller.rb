class RatePeriodsController < ApplicationController
  before_filter :set_title

  def index
    @rate_periods = RatePeriod.all
  end

  def new

  end

  private

  def set_title
    @title = "NCI Rate periods"
  end

end
