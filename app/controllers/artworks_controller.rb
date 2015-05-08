class ArtworksController < ApplicationController
  before_action :find_artwork, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_artist!, except: [:index, :show]

  def index
    @artworks= Artwork.all.order("created_at DESC")
  end

  def show
    @comments= Comment.where(artwork_id: @artwork)
  end

  def new
    @artwork= current_artist.artworks.build
  end

  def create
    @artwork= current_artist.artworks.build(artwork_params)

    if @artwork.save
      redirect_to @artwork
    else
    render 'new'
    end
  end

  def edit
  end

  def update
    if @artwork.update(artwork_params)
      redirect_to @artwork
    else
      render 'edit'
    end

  end

  def destroy
    @artwork.destroy
    redirect_to root_path
  end

  def upvote
    @artwork.upvote_by current_artist
    redirect_to :back
  end

  def downvote
    @artwork.downvote_by current_artist
    redirect_to :back
  end

  private

  def find_artwork
    @artwork= Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :link, :description, :image)
  end

end
