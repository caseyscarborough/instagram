module Instagram
  class Client

    # Methods for the Media API.
    #
    # @see http://instagram.com/developer/endpoints/media/
    module Media

      # Get information about a media object.
      #
      # @param id [Integer] The ID of the media item.
      # @return [Hashie::Mash]
      # @see http://instagram.com/developer/endpoints/media/#get_media
      # @example
      #   client.media(5211)
      def media(id)
        get "/media/#{id}", auth_params
      end

      # Search for media in a given area.
      #
      # @param options [Hash] Options.
      # @option options [String] :lat Latitude of the center search coordinate. If used, lng is required.
      # @option options [String] :lng Longitude of the center search coordinate. If used, lat is required.
      # @option options [Integer] :max_timestamp A unix timestamp. All media returned will be taken earlier than this timestamp.
      # @option options [Integer] :min_timestamp A unix timestamp. All media returned will be taken later than this timestamp.
      # @option options [Integer] :distance Default is 1km (distance=1000), max distance is 5km.
      # @see http://instagram.com/developer/endpoints/media/#get_media_search
      # @example Perform a search based on latitude and longitude.
      #   client.media_search(:lat => "48.858844", :lng => "2.294351")
      # @example Search within 2km.
      #   client.media_search(:distance => 2000)
      # @example Search by timestamp.
      #   client.media_search(:min_timestamp => 1357020000, :max_timestamp => 1375246800)
      def media_search(options={})
        get '/media/search', auth_params.merge(options)
      end

      # Get a list of what media is most popular at the moment.
      #
      # @return [Hashie::Mash]
      # @see http://instagram.com/developer/endpoints/media/#get_media_popular
      def popular_media
        get '/media/popular', auth_params
      end

    end

  end
end