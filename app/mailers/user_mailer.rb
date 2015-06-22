class UserMailer < ApplicationMailer
	def send_recommendation email, product_title, product_url ,customer, comment, product_price, product_desc
		@email_address = email
		@product_title = product_title
		@product_url 	 = product_url
		@product_price = product_price
		@product_desc  = product_desc
		@customer      = customer
		@comment       = comment
		mail(to: @email_address, subject: "#{@customer.first_name.humanize} recommended a product")
	end
end
