class WelcomeController < ApplicationController
  def index
    @articles = Article.limit(1).order('created_at DESC')
    @stories = Story.limit(2).order('created_at DESC')
    @featured = Story.find(72)
  end

  def about
  end

  def show
    @articles = Article.order('created_at DESC')
    @stories = Story.order('created_at DESC')
  end




end
