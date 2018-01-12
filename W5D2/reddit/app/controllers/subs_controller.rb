class SubsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_mod, only: [:edit, :update]
  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    @posts = @sub.posts
    render :show
  end

  private
  def require_mod
    @sub = Sub.find_by(id: params[:id])
    if @sub
      if current_user.id != @sub.mod_id
        flash[:errors] = ["Only the mod can edit"]
        redirect_to sub_url(@sub)
      end
    else
      flash[:errors] = ["Sub does not exist"]
      redirect_to subs_url
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
