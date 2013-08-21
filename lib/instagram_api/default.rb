module Instagram
  module Default

    API_ENDPOINT = "https://api.instagram.com/v1/".freeze
    AUTH_URL = "https://api.instagram.com/oauth/authorize/".freeze
    ACCESS_TOKEN_URL = "https://api.instagram.com/oauth/access_token/".freeze

    CLIENT_ID = nil
    CLIENT_SECRET = nil
    CALLBACK_URL = nil
    ACCESS_TOKEN = nil

  end
end

class ::Hash
  def method_missing(name)
    return self[name] if key? name
    self.each { |k,v| return v if k.to_s.to_sym == name }
    super.method_missing name
  end
end