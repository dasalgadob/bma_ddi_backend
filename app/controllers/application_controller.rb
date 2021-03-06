class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?

  #protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :admin, :is_disabled])
  end
end
