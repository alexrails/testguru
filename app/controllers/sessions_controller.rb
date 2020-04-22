class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create new]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:target_page] || root_path
    else
      flash.now[:alert] = 'Are you Guru? Verify your Email and Password!'
      render :new
    end
  end

  def destroy
    cookies.delete(:target_page)
    session.delete(:user_id)
    redirect_to login_path
  end
end
