class WelcomeController < ApplicationController
  def index
  end

  def about
  end

  def show
    @articles = Article.order('created_at DESC')
    @stories = Story.order('created_at DESC')
  end


end
