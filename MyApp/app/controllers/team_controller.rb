class TeamController < ApplicationController
	before_action :check_permission, only: [:index, :destroy]

  def index
    @team_presentation = TeamPresentation.first
    @users = User.invitation_sent
  end


  def destroy
    @user = User.find(params[:id])
    RemoveTeamMemberJob.perform_later(@user)
    redirect_back(fallback_location: root_path)
  end

  def check_permission
    authorize self
  end

end
