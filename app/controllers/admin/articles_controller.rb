class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!

  def index
    @articles = Article.order('created_at DESC')
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to [:admin, @article]
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to [:admin, @article]
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :takeaway, :action, :sources, :hero, :timestamps, :tag_list, :picture_list => [])
  end

end
