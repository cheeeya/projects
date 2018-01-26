class GoalsController < ApplicationController

  def new
    @goal = Goal.new
    render :new
  end

  def edit
    @goal = Goal.find_by(id: params[:id])
    render :edit
  end

  def show
    @goal = Goal.find_by(id: params[:id])
    render :show
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:error] = @goal.errors.full_messages
      render :new
    end
  end

  def update
    @goal = Goal.find_by(id: params[:id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:error] = @goal.errors.full_messages
      render :edit
    end
  end


  private
  def goal_params
    params.require(:user).permit(:user_id, :private, :body)
  end
end
