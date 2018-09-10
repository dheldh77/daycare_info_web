class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :usertype, :userage, :usersex, :telephone, :career, :certification])
  end

  # protect_from_forgery with: :exception
end
