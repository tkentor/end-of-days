class StoriesController < ApplicationController
  before_action :set_story, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @stories = Story.order('created_at DESC')
  end

end
