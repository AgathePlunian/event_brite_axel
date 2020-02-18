class Attendance < ApplicationRecord
	# MAILER CALLBACK
	after_create :new_attendant_send

	# LINK
	belongs_to :event
	belongs_to :user

	validate :is_admin
	validate :already_attending

	def is_admin
		if (self.user == event.admin)
			self.errors.add(:user,
											"ERREUR - Vous ne pouvez pas vous inscrire a votre propre Evenement.")
		end
	end	

	def already_attending
		new_guest = self.user
		self.event.users.each do |each_user|
			if new_guest == each_user
				self.errors.add(:user, "ERREUR - Vous etes deja inscrit a cet evenement.")
			end
		end
	end

	# MAILER

  def new_attendant_send
		UserMailer.new_attendant_email(self.event, self.user).deliver_now
  end
end
