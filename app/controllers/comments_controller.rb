class CommentsController < ApplicationController

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

end
