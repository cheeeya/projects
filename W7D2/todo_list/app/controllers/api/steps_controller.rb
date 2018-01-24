class Api::StepsController < ApplicationController
  def show
    @step = Step.find(params[:id])
  end

  def update

  end

  def destroy
  end

  def create

  end

  def step_params
    params.require(:step).permit(:title, :description);
  end
end
