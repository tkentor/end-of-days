class PicturesController < ApplicationController

  def show
    @picture = Picture.find(params[:id])
    # @pieces = @picture.pieces
    @articles = @picture.articles.order('created_at DESC')
    @stories = @picture.stories.order('created_at DESC')
  end

  def user_params
    params.require(:picture).permit(:description, :rating)
  end

end
