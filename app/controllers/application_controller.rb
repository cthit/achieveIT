class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  rescue_from SecurityError, with: :not_signed_in
  helper_method :nick
  helper_method :verify_access

  
  
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      @provider = Provider.find_by(api_key: token)
      @provider.present?
    end
  end

  def verify_access
    if not cookies[:chalmersItAuth].present?
      raise SecurityError, "Missing cookie"
    end
    NickHelper.get_user cookies[:chalmersItAuth]
  end

  def nick cid
    NickHelper.nick cid
  end

  private
    def not_signed_in
      redirect_to "https://account.chalmers.it?redirect_to=#{request.original_url}"
    end

end
