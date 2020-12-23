module Api
  module V1
    class StoriesController < ApplicationController
      #before_action :restrict_access
      before_action :set_story, only: [:show, :edit, :update, :destroy]
      respond_to :json

      def set_story
        @story = Story.friendly.find(params[:id])
        authorize @story
      end


      def index    
        params[:search] ? @stories = policy_scope(Story.most_recent.where('title LIKE ?', "%#{params[:search]}%")) : @stories = policy_scope(Story.most_recent)
        respond_with @stories
      end

      def create
        respond_with Story.create(story_params)
      end

      def update
        respond_with Story.update(story_params)
      end

      def show
        respond_with @story
      end

      def destroy
        respond_with Story.destroy(@story)
      end

      private 
      
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end

      def story_params
        params.require(:story).permit(:title, :content, :tag_list)
      end


    end
  end
end