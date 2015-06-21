module ApplicationHelper
	def form_styles form_attribute
		"font-family: #{form_attribute.font_family}; color: #{form_attribute.color}; background-color: #{form_attribute.background_color}"	if form_attribute
	end

	def input_styles form_attribute
		"width: #{form_attribute.width}; border: #{form_attribute.border}; color: #{form_attribute.color}; font-family: #{form_attribute.font_family};" if form_attribute
	end

	def button_styles form_attribute
		"background-color: #{form_attribute.button_color}; color: #{form_attribute.color}; font-family: #{form_attribute.font_family};" if form_attribute
	end
end
