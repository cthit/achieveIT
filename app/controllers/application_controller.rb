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

  class NickHelper

		include HTTParty
		base_uri "https://account.chalmers.it/userInfo.php"

		def self.nick cid
			Rails.cache.fetch "#{cid}/nick", expires_in: 24.hours do
				resp = send_request(query: { cid: cid })
				if resp['nick'].present?
					resp['nick']
				else
					cid
				end
			end
		end

		def self.get_user token
			send_request(query: {token: token})
		end

		private
			def self.send_request(options)
				resp = get("", options)
				if resp.success? && resp['cid'].present?
					resp
				else
					raise SecurityError, resp['error']
				end
			end
	end	

	private
       def not_signed_in
         redirect_to "https://account.chalmers.it?redirect_to=#{request.original_url}"
       end

end
