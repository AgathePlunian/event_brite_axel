class UserMailer < ApplicationMailer
	default from: 'no-reply@eventbriteaxel.fr'

	def welcome_email(user)
		@user = user
		@url = 'https://monsite.fr/login'
		mail(to: @user.email, subject: 'Bienvenue chez nous !')
	end

	def new_attendant_email(event, user)
		@admin = event.admin
		@event = event
		@user = user
		@url = 'https://monsite.fr/event'
		mail(to: @admin.email, subject: "Nouvelle participation pour #{@event.title}")
	end
end
