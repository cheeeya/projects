class UsersController < ApplicationController

  # get
  def index
    users = User.all
    render json: users
  end

  # post, put
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # get
  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  # patch
  def update
    user = User.find_by(id: params[:id])
    if user
      user.update(user_params)
      render json: user
    else
      render plain: 'User not found!', status: 404
    end
  end

  # delete
  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      redirect_to users_url
    else
      render plain: 'User not found!', status: 404
    end
  end

  private

  def user_params
    params[:user].permit(:username)
  end
end
