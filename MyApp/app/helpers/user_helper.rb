module UserHelper
	def user_status(user)
		!user.invitation_accepted_at && user.invitation_sent_at ? "Pending" : "Accepted"
	end
end