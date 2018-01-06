class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:error] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by_id(params[:id])
    @bands = Band.all
    render :edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :title, :year, :live)
  end
end
