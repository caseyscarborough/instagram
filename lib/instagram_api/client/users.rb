module Instagram
  class Client

    module Users

      def user(user=nil)
        case user
        when Integer
          get "/users/#{user}", auth_params
        when String
          results = search(user)
          get "/users/#{results[0].id}", auth_params
        when nil
          get '/users/self', auth_params
        end
      end

      def search(query=nil)
        options = { q: query }
        response = get "/users/search", options.merge(auth_params)
        response.data
      end

      def feed
        get '/users/self/feed', auth_params
      end

      def recent(id=nil)
        if id
          get "/users/#{id}/media/recent", auth_params
        else
          get "/users/self/media/recent", auth_params
        end
      end

      def liked
        get '/users/self/media/liked', auth_params
      end

    end

  end
end