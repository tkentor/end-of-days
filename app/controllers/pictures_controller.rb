class PicturesController < ApplicationController

  def show
    @picture = Picture.find(params[:id])
    @articles = @picture.articles
    @stories = @picture.stories
  end

end
