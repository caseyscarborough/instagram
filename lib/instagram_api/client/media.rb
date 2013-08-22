module Instagram
  class Client

    module Media

      def media(id)
        get "/media/#{id}", auth_params
      end

      def media_search(options={})
        get '/media/search', auth_params.merge(options)
      end

      def popular_media
        get '/media/popular', auth_params
      end

    end

  end
end