class TeamController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
		redirect_to root_path unless current_user.role == 'admin'
	end

end
