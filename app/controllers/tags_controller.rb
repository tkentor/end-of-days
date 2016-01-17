class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @articles = @tag.articles.order('created_at DESC')
    @stories = @tag.stories.order('created_at DESC')
  end

end
