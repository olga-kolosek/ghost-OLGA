class TeamPresentationsController < ApplicationController

  before_action :set_team_presentation, only: [:show, :edit, :update, :destroy]
  
  def set_team_presentation
    @team_presentation = TeamPresentation.first
    authorize @team_presentation
  end

  def new
    @team_presentation = TeamPresentation.new
    authorize @team_presentation
  end

  def create
    @team_presentation = TeamPresentation.new(team_presentation_params)
    @team_presentation.save
    redirect_to team_path
    authorize @team_presentation
  end

  def team_presentation_params
    params.require(:team_presentation).permit(:name, :description)
  end

  def edit
  end

  def update
    @team_presentation.update(team_presentation_params)
    redirect_to team_path
  end

  def show
  end

  def destroy
    @team_presentation.destroy
    redirect_to team_path
  end
end
