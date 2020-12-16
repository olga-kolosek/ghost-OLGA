class TeamController < ApplicationController
	before_action :authenticate_user!
	before_action :admin?, only: [:index]

  def admin?
    redirect_to root_path if current_user.role != 'admin'
  end

  def index
    @users = User.team_scope
  end

end
