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
