class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_params, if: :devise_controller?
  before_action :set_locale


  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def default_url_options
    I18n.locale != I18n.default_locale ? { lang: I18n.locale } : {}
  end
end
