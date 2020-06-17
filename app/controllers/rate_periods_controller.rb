class RatePeriodsController < ApplicationController
  before_filter :set_title

  def index
    @rate_periods = RatePeriod.all
  end

  def new
    @btn_text = "Create"
    @rate_period = RatePeriod.new
  end

  def create
    @rate_period = RatePeriod.new(params[:rate_period])
    if @rate_period.save
      flash[:notice] = "Your new rate periods was saved successfully."
      redirect_to rate_periods_path
    else
      render 'rate_periods/new'
    end
  end

  def edit
    @btn_text = "Edit"
    @rate_period = RatePeriod.find(params[:id])
  end

  # update method will archive the current rate period and create a new one
  # to keep the historic
  def update



  end

  private

  def set_title
    @title = "NCI Rate periods"
  end

end
