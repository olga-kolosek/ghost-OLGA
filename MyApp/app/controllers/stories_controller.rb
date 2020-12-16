class StoriesController < ApplicationController
  include Pundit

  before_action :authenticate_user!
  
  def set_story
      @story = Story.find(params[:id])
      authorize @story
  end

  def index
    if current_user.admin? || current_user.editor?
      @stories = Story.most_recent
    else
      @stories = policy_scope(Story.most_recent)
      @stories = @stories.where(user_id: current_user.id)
    end
  end

end
