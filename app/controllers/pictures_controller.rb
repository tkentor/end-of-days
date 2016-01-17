class PicturesController < ApplicationController

  def show
    @picture = Picture.find(params[:id])
    @articles = @picture.articles.order('created_at DESC')
    @stories = @picture.stories.order('created_at DESC')
  end

end
