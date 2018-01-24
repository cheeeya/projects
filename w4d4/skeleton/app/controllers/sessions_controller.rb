class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to cats_url
    else
      render plain: "Invalid password/username"
    end
  end

  def destroy
    logout!
    redirect_to cats_url
  end
end
