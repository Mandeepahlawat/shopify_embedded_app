class Recommendation < ActiveRecord::Base
	belongs_to :customer

	validates :shopify_product_id, :friend_email, presence: true
	validates :friend_email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}

	def send_recommendation_email
		product_title, product_url, product_price, product_desc = product_url_and_title shopify_product_id
		UserMailer.send_recommendation(friend_email, product_title, product_url , customer, comment, product_price, product_desc ).deliver_now
	end

	def get_product id
		product = ShopifyAPI::Product.find id
	end

	def product_url_and_title product_id
		product 		= get_product product_id
		title 			= product.title
		url 				= "https://#{customer.shop.shopify_domain}/products/#{product.handle}"
		price   		= product.variants.first.price
		description = product.body_html
		[title, url, price, description]
	end
end
