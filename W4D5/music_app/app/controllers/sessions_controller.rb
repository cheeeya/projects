class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      user.reset_session_token!
      login!(user)
      redirect_to user_url(user)
    else
      render plain: "Invalid Username or Password"
    end
  end

  def destroy
    logout!
    redirect_to bands_url
  end
end
