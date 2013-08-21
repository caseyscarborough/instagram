require 'json'

module Instagram
  class Client

    include HTTParty
    base_uri Default::API_ENDPOINT

    attr_accessor :client_id, :client_secret, :callback_url, :access_token

    def initialize(options={})
      if options[:access_token]
        @access_token = options[:access_token]
      else
        @client_id = options[:client_id]
        @client_secret = options[:client_secret]
        @callback_url = options[:callback_url]
      end
    end

    def authorize_url(options={})
      "#{Default::AUTH_URL}?client_id=#{@client_id}&redirect_uri=#{@callback_url}&response_type=code"
    end

    def get_access_token(code=nil)
      unless @access_token
        params = { 
          client_id: @client_id,
          client_secret: @client_secret,
          grant_type: 'authorization_code',
          redirect_uri: @callback_url,
          code: code
        } 
        response = post Default::ACCESS_TOKEN_URL, {}, params, { 'Content-type' => 'application/x-www-form-urlencoded' }
        @access_token = response['access_token']
      else
        @access_token
      end
    end

    private

      def post(url, params={}, body={}, headers={})
        response = self.class.post url, params: params, body: body
        response.parsed_response
      end

      def auth_params
        @access_token ? { access_token: @access_token } : { client_id: @client_id }
      end

  end
end