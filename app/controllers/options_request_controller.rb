class OptionsRequestController < ApplicationController
  # skip_before_action :verify_authenticity_token
  
  ACCESS_CONTROL_ALLOW_METHODS = %w(GET POST PUT PATCH DELETE OPTIONS).freeze
  ACCESS_CONTROL_ALLOW_HEADERS = %w(Accept Origin Content-Type Authorization Token X-Requested-With).freeze
  ACCESS_CONTROL_MAX_AGE = 86_400

  def preflight
    set_preflight_headers!
    head :ok
  end

  private

    def set_preflight_headers!
      response.set_header('Access-Control-Max-Age', ACCESS_CONTROL_MAX_AGE)
      response.set_header('Access-Control-Allow-Headers', ACCESS_CONTROL_ALLOW_HEADERS.join(','))
      response.set_header('Access-Control-Allow-Methods', ACCESS_CONTROL_ALLOW_METHODS.join(','))
      response.set_header('Access-Control-Allow-Origin', 'http://localhost:5173')
      response.set_header('Access-Control-Allow-Credentials', true)
      response.set_header('Content-Type', 'application/json')
    end
end
