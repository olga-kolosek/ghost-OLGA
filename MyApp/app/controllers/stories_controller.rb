class StoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  
  def set_story
    @story = Story.find(params[:id])
    authorize @story
  end


  def index
    @stories = policy_scope(Story.most_recent)
  end

  def new
    @story = Story.new
    authorize @story
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user
    @story.save
    redirect_to stories_path
    authorize @story
  end

  def story_params
    params.require(:story).permit(:title, :content)
  end

  def edit
  end

  def update
    @story.update(story_params)
    redirect_to stories_path
  end

  def show
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

end
