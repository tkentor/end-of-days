class StoriesController < ApplicationController
  before_action :set_story, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # def index
  #   @stories = Story.order('created_at DESC')
  # end

  def index
    if params[:search]
      @stories = Story.search(params[:search]).order('created_at DESC')
    else
      @stories = Story.order('created_at DESC')
    end
  end

end
