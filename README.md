# Instagram API

This gem is a simple and easy to use wrapper for Instagram's API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'instagram_api'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install instagram_api
```

## Usage

All methods in Instagram's API require some kind of authentication. You can retrieve any public data by using just your client ID, but it is recommended to authorize yourself (and your users) using an access_token. You can get your client ID and client secret by visiting [http://instagram.com/developer](http://instagram.com/developer).

```ruby
# Instantiate a new client.
client = Instagram.client(
  :client_id => 'asdfljsdfojef2342oejfojfw304',
  :client_secret => 'afoeu39fu3508520u53j23f9jt4y4y4',
  :callback_url => 'http://example.com/'
)

# Visit the authorization URL in your browser and login.
client.authorize_url
# => "https://api.instagram.com/oauth/authorize/?client_id=asdfljsdfojef2342oejfojfw304&redirect_uri=http://example.com/&response_type=code"

# Retrieve the code from the URL parameters and use it to get an access token.
client.get_access_token('88fb89ab65454da2a06f2c6dacd09436')
# => '1313345.3flmg64.r0fjggj4oi02prm3fljg5000'
```

The last method, `get_access_token`, will return your access token as well as set it for your client. You can then access any method in the API using your client.

Alternatively, after you or your user have authenticated, you can reinstantiate your client using the previously returned access token.

```ruby
client = Instagram.client(:access_token => '1313345.3flmg64.r0fjggj4oi02prm3fljg5000')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
