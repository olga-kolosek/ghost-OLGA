module UserHelper
  def user_status(user)
    if !(user.deleted_at == nil)
      "Deleted"
    else  
      !user.invitation_accepted_at && user.invitation_sent_at ? "Pending" : "Accepted"
    end
  end
end