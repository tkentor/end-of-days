class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @articles = @tag.articles
    @stories = @tag.stories
  end

end
