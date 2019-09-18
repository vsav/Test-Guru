class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      url = cookies[:requested_url] ||= tests_path
      redirect_to url
    else
      flash.now[:alert] = 'Please check your email and password and try again'
      render :new
    end
  end

  def destroy
    cookies[:requested_url] = nil
    session.delete(:user_id)
    redirect_to login_path
  end
end
