class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    unless current_user
      redirect_to login_path, notice: 'Please log in'
    end
    cookies[:email] = current_user&.email
    cookies[:user_id] = current_user&.id
    cookies[:requested_url] = request.url
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
