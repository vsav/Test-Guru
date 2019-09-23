class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(user)
    if user.admin?
      admin_root_path
    else
      root_path
    end

  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) || I18n.default_locale
  end
end
