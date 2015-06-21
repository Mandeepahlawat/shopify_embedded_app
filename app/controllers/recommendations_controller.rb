class RecommendationsController < ApplicationController
  around_filter :shopify_session
  before_filter :set_shop
  before_filter :create_or_set_customer, only: [:new, :create]
  layout 'embedded_app'

  def index
    @recommendations = @shop.recommendations
  end

  def new
    @recommendation       = @customer.recommendations.build
    @form_attribute       = @shop.form_attribute
    session[:customer_id] = @customer.id
    @products             = ShopifyAPI::Product.all
    render content_type: 'application/liquid'
  end

  def create
  	@recommendation = @customer.recommendations.build(recommendation_params)
  	if @recommendation.save
      @recommendation.send_recommendation_email
  		redirect_to new_recommendation_path, notice: "Product Recommendation is sent."
  	else
  		render "new"
  	end
  end

  private

  	def set_shop
  		@shop = Shop.find_by_shopify_domain @shop_session.url
  	end

  	def create_or_set_customer
  		@customer = Customer.find_by_shopify_customer_id params[:id] if params[:id]
      @customer = Customer.find_by_id session[:customer_id] if session[:customer_id]
      @customer = @shop.create_new_customer params[:id] unless @customer
  	end

  	def recommendation_params
  		params.require(:recommendation).permit(:shopify_product_id, :friend_email, :comment, :customer_id)
  	end

end
