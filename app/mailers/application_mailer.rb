class ApplicationMailer < ActionMailer::Base
	default_url_options[:host] = "rocky-caverns-6007.herokuapp.com/"
	default from: "amarjeetsingh755@teksavant.com"
	layout 'mailer'

	def password_reset(user)
		@user = user
		mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>",
		 subject: "Reset your password")
	end
end
