class ArtworksController < ApplicationController
  # get
  def index
    if params.key?(:user_id)
      artworks = Artwork.where(artist_id: params[:user_id])
    else
      artworks = Artwork.all
    end
    render json: artworks
  end

  # post, put
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  # get
  def show
    artwork = Artwork.find_by(id: params[:id])
    render json: artwork
  end

  # patch
  def update
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.update(artwork_params)
      render json: artwork
    else
      render plain: 'Artwork not found!', status: 404
    end
  end

  # delete
  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.destroy
      redirect_to artworks_url
    else
      render plain: 'Artwork not found!', status: 404
    end
  end

  private

  def artwork_params
    params[:artwork].permit(:title, :image_url, :artist_id)
  end
end
