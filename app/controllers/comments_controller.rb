class CommentsController < ApplicationController
  before_action :authenticate_artist!

  def create
    @artwork= Artwork.find(params[:artwork_id])
    @comment= Comment.create(params[:comment].permit(:content))
    @comment.artist_id= current_artist.id
    @comment.artwork_id= @artwork.id

    if @comment.save
      redirect_to @artwork
    else
      render 'new'
    end
  end

  def destroy
    @artwork=Artwork.find(params[:artwork_id])
    @comment= @artwork.comments.find(params[:id])
    @comment.destroy
    redirect_to artwork_path(@artwork)
  end

end
