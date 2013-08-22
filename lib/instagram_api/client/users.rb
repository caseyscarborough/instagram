module Instagram
  class Client

    module Users

      def user(user=nil)
        case user
        when Integer
          get "/users/#{user}", auth_params
        when String
          results = search(user)
          get "/users/#{results.data[0].id}", auth_params
        when nil
          get '/users/self', auth_params
        end
      end

      def search(query=nil)
        get "/users/search", auth_params.merge(q: query)
      end

      def feed
        get '/users/self/feed', auth_params
      end

      def recent(id=nil)
        url = id ? "/users/#{id}/media/recent" : "/users/self/media/recent"
        get url, auth_params
      end

      def liked
        get '/users/self/media/liked', auth_params
      end

    end

  end
end