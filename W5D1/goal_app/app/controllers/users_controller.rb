class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def  create
    @user = User.create(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
