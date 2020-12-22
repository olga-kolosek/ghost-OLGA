class SettingsController < ApplicationController
 before_action :get_setting, only: [:edit, :update]
 
 def edit
 end

def update
    @setting.update(setting_params)
    redirect_to settings_path
end

def get_setting
  @setting = Setting.find_by(var: params[:id]) || Setting.new(var: params[:id])
  authorize @setting
end

def index
  @settings = Settings.all
end

def new
end

def create
  setting_params.keys.each do |key|
    next if setting_params[key].nil?

    @setting = Setting.new(var: key)
    @setting.value = setting_params[key].strip
    unless @setting.valid?
      @errors.merge!(setting.errors)
    end
  end

  setting_params.keys.each do |key|
    Setting.send("#{key}=", setting_params[key].strip) unless setting_params[key].nil?
  end
  authorize @setting
  redirect_to settings_path, notice: "Setting was successfully updated."
end


private

def setting_params
  params.require(:setting).permit(:app_name, :description)
end

end
