class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:search]
      @articles = Article.search(params[:search]).order('created_at DESC')
    else
      @articles = Article.order('created_at DESC')
    end
  end

end
