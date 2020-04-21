class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create new]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to previous_page
    else
      flash.now[:alert] = 'Are you Guru? Verify your Email and Password!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  private

  def previous_page
    return cookies[:previous_page] if cookies[:previous_page].present?
    root_path
  end
end
