class FormAttributesController < ApplicationController
  around_filter :shopify_session
  layout 'embedded_app'

  def new
    
  end

end
