class SettingsController < ApplicationController

  before_filter :set_setting, only: [:show, :edit, :update]
  before_filter :set_title

  def show
    @section_title = "Company profil"
    redirect_to new_setting_path unless @setting
  end

  def new
    @section_title = "Company profil - create your profile"
    @setting = Setting.new
  end

  def edit
    @section_title = "Company profil - edit your profile"
  end

  def create
    @setting = Setting.new(params[:setting])
    if @setting.save
      flash[:notice] = "Your settings were saved successfully."
      redirect_to setting_path(1)
    else
      @section_title = "Company profil - create your profile"
      render 'settings/new'
    end
  end

  def update
    if @setting.update_attributes(params[:setting])
      flash[:notice] = "Your settings were updated successfully."
      redirect_to setting_path
    else
      @section_title = "Company profil - edit your profile"
      render 'settings/edit'
    end
  end

  private

  def set_setting
    @setting = Setting.first
  end

  def set_title
    @title = "NCI setting"
  end

end
