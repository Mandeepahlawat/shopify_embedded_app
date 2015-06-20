class Shop < ActiveRecord::Base
  include ShopifyApp::Shop

  has_one  :form_attribute
  has_many :customers
  has_many :recommendations, through: :customers

  def create_new_customer shopify_customer_id
  	customer = ShopifyAPI::Customer.find shopify_customer_id
  	customers.create(first_name: customer.first_name, last_name: customer.last_name, email: customer.email, shopify_customer_id: customer.id)
  end
end
