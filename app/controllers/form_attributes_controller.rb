class FormAttributesController < ApplicationController
  around_filter :shopify_session
  before_filter :set_shop
  before_filter :form_attribute_already_present, only: :new
  layout 'embedded_app'

  def new
    @form_attribute = @shop.build_form_attribute
  end

  def create
  	@form_attribute = @shop.build_form_attribute(form_attribute_params)
  	if @form_attribute.save
  		redirect_to edit_form_attribute_path(@form_attribute), notice: "Form Snippet attributes saved."
  	else
  		render "new"
  	end
  end

  def edit
  	@form_attribute = @shop.form_attribute
  end

  def update
  	if @shop.form_attribute.update(form_attribute_params)
  		redirect_to edit_form_attribute_path(@shop.form_attribute), notice: "Form Snippet attributes saved."
  	else
  		render "edit"
  	end
  end

  private

  	def set_shop
  		@shop = Shop.find_by_shopify_domain @shop_session.url
  	end

  	def form_attribute_already_present
  		redirect_to edit_form_attribute_path(@shop.form_attribute) if @shop.form_attribute
  	end

  	def form_attribute_params
  		params.require(:form_attribute).permit(:id, :width, :border, :color, :background_color, :font_family, :button_color)
  	end

end
