class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @provider = Provider.find_by(api_key: token)
      @provider.present?
    end
  end
end
