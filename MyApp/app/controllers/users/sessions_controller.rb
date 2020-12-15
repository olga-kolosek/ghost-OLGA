# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :set_last_seen_at, if: proc { current_user && (session[:last_seen_at] == nil || session[:last_seen_at] < 15.minutes.ago) }


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def create
    # custom sign-in code
    super
  end

  def new
    super
  end

  def destroy
    super
  end

  private
  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.current)
    session[:last_seen_at] = Time.current
    puts "UPDATED LAST SEEN"
  end  
    
end
