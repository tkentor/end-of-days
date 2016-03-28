class Admin::StoriesController < ApplicationController
  before_action :set_story, only: [:show]
  before_action :authenticate_user!

  def index
    @stories = Story.order('created_at DESC')
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      redirect_to [:admin, @story]
    else
      render 'new'
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update(story_params)
      redirect_to [:admin, @story]
    else
      render 'edit'
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to admin_stories_path
  end

  private
  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :link, :source, :excerpt, :take, :timestamps, :tag_list, :picture_list => [])
  end

end
