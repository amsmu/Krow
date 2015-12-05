class ApplicationMailer < ActionMailer::Base
	default_url_options[:host] = "localhost:3000"
	default from: "amarjeetsingh755@gmail.com"
	layout 'mailer'

	def password_reset(user)
		@user = user
		mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>",
		 subject: "Reset your password")
	end
end
