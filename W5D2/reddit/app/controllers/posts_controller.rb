class PostsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :require_author, only: [:edit, :update]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy

  end

  private
  def require_author
    @post = Post.find_by(id: params[:id])
    if @post
      if current_user.id != @post.author_id
        flash[:errors] = ["Only the author can edit"]
        redirect_to post_url(@post)
      end
    else
      flash[:errors] = ["Post does not exist"]
      redirect_to subs_url
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
