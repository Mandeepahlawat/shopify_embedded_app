class UserMailer < ApplicationMailer
	def send_recommendation email, product_title, product_url ,customer
		@email_address = email
		@product_title = product_title
		@product_url 	 = product_url
		@customer      = customer
		mail(to: @email_address, subject: "#{@customer.first_name.humanize} recommended a product")
	end
end
