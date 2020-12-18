class TeamController < ApplicationController
	before_action :admin?, only: [:index, :remove_member]

  def admin?
    redirect_to root_path if current_user.role != 'admin'
  end

  def index
    @users = User.invitation_sent
  end


  def remove_member
    @user = User.find(params[:id])
    RemoveTeamMemberJob.perform_later(@user)
    redirect_back(fallback_location: root_path)
  end

end
