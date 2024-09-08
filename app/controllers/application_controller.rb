class ApplicationController < ActionController::Base
  after_action :set_csrf_token_header
  
  protect_from_forgery with: :exception
  
  private
  
    def set_csrf_token_header
      response.set_header('X-CSRF-Token', form_authenticity_token)
    end
end
