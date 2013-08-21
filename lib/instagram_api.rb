require 'httparty'
require 'instagram_api/default'
require 'instagram_api/client'

module Instagram
  
  VERSION = "0.0.1"

  class << self
  
    def client(options={})
      @client = Instagram::Client.new(options) unless @client
      @client
    end

    private
      
      def method_missing(name, *args, &block)
        client.send(name, *args, &block)
      end

  end
end
