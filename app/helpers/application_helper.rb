module ApplicationHelper
	def form_styles form_attribute
		if form_attribute
			"font-family: #{form_attribute.font_family}; color: #{form_attribute.color}; background-color: #{form_attribute.background_color};"
		else
			""
		end
	end

	def input_styles form_attribute
		if form_attribute
			"width: #{form_attribute.width}; border: #{form_attribute.border}; color: #{form_attribute.color}; font-family: #{form_attribute.font_family};"
		else
			""
		end
	end

	def button_styles form_attribute
		if form_attribute
			"background-color: #{form_attribute.button_color}; color: #{form_attribute.color}; font-family: #{form_attribute.font_family};"
		else
			""
		end
	end
end
