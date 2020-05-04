class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_params, if: :devise_controller?
  private

  def after_sign_in_path_for(user)
    user.is_a?(Admin) ? admin_tests_path : root_path
  end

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
