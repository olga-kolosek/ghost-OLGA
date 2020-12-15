module UserHelper
	def user_status(user)
		if !user.invitation_accepted_at && user.invitation_sent_at
			return "Pending"
		else
			return "Accepted"
		end
	end
end