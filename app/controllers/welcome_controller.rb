class WelcomeController < ApplicationController
  def index
    @articles = Article.order('created_at DESC')
    @stories = Story.limit(2).order('created_at DESC')
  end

  def about
  end

  def show
    @articles = Article.order('created_at DESC')
    @stories = Story.order('created_at DESC')
  end




end
