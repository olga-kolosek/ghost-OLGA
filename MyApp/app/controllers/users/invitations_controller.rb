class Users::InvitationsController < Devise::InvitationsController

    # this is called when creating invitation
    # should return an instance of resource class
    def invite_resource
      # skip sending emails on invite
      User.invite!(invite_params) do |invitable| 
        invitable.update(role: invite_params[:role])
      end
    end

    private 
    # this is called when accepting invitation
    # should return an instance of resource class
    def accept_resource
      resource = resource_class.accept_invitation!(update_resource_params)
      # Report accepting invitation to analytics
      #Analytics.report('invite.accept', resource.id)
      resource
    end

    def after_invite_path_for(resource)
      new_user_session_path
    end

    def after_accept_path_for(resource)
      root_path 
    end

  protected

  def invite_params
    params.require(:user).permit(:email, :role)
  end  
end