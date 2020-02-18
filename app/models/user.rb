class User < ApplicationRecord
	# MAILER CALLBACK
	after_create :welcome_send

	# LINK
	has_many :attendances
	has_many :events, through: :attendances

	# VALIDATIONS
	validates :email, presence: true,
		uniqueness: true
	validates :first_name, presence: true,
		length: {minimum: 2}
	validates :last_name, presence: true,
		length: {minimum: 2}
	validates :description, presence: true,
		length: {minimum: 20, maximum: 500}

	private

	# MAILER
	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	end
end
