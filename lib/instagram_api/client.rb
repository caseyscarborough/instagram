require 'instagram_api/client/media'
require 'instagram_api/client/users'

module Instagram

  # Client for the Instagram API.
  #
  # @see http://instagram.com/developer/
  class Client

    include HTTParty
    base_uri Default::API_ENDPOINT

    include Instagram::Client::Media
    include Instagram::Client::Users

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

    # Return the authorize URL for a client.
    #
    # @return [String] The authorization URL.
    # @see http://instagram.com/developer/authentication/
    def authorize_url
      "#{Default::AUTH_URL}?client_id=#{@client_id}&redirect_uri=#{@callback_url}&response_type=code"
    end

    # Get an access token for a user.
    #
    # @param code [String] The code retrieved after authorizing a user.
    # @return [String] The Access Token.
    # @see http://instagram.com/developer/authentication/
    # @example
    #   client.get_access_token('88fb89ab65454da2a06f2c6dacd09436')
    #   # => '1313345.3fedf64.a0fcb7f40e02fe3da50500'
    def get_access_token(code=nil)
      unless @access_token
        params = { 
          client_id: @client_id,
          client_secret: @client_secret,
          grant_type: 'authorization_code',
          redirect_uri: @callback_url,
          code: code
        } 
        response = post "https://api.instagram.com/oauth/access_token", {}, params, { 'Content-type' => 'application/x-www-form-urlencoded' }
        @access_token = response['access_token']
        @access_token
      else
        @access_token
      end
    end

    private
      def get(url, params={})
        response = self.class.get url, query: params
        Hashie::Mash.new response.parsed_response
      end

      def post(url, params={}, body={}, headers={})
        response = self.class.post url, params: params, body: body
        Hashie::Mash.new response.parsed_response
      end

      def auth_params
        @access_token ? { access_token: @access_token } : { client_id: @client_id }
      end

  end
end