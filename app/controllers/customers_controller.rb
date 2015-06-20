class CustomersController < ApplicationController
  around_filter :shopify_session
  before_filter :set_shop
  layout 'embedded_app'

  def index
    @customers = @shop.customers
  end

  private

  	def set_shop
  		@shop = Shop.find_by_shopify_domain @shop_session.url
  	end
end
