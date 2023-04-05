class ApplicationController < ActionController::Base

  require 'bgg'
  include PresenceCheck

    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
     # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :surname, :user_image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :surname, :user_image])
  end

end
