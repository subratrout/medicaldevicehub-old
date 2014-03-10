class UserMailer < ActionMailer::Base
  default from: "do-not-reply@example.com"

  	def contact_email(contact)
		@contact = contact
		mail(to: ENV["GMAIL_USERNAME"], from: @contact.email, :subject => "Somebody contacted you on Medical Device Hub")
	end
end
