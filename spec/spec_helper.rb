require 'instagram_api'
require 'webmock/rspec'
require 'vcr'

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.run_all_when_everything_filtered = true
  c.filter_run :focus
  c.include WebMock::API

  if File.exist?(File.expand_path('../config.yml', __FILE__))
    config = YAML.load(File.read(File.expand_path('../config.yml', __FILE__)))
    config.each { |k,v| ENV[k] = v unless v.kind_of? Hash }
  end

end

VCR.configure do |c|
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<INSTAGRAM_API_TEST_CLIENT_ID>") do
    ENV['INSTAGRAM_API_TEST_CLIENT_ID']
  end
  c.filter_sensitive_data("<INSTAGRAM_API_TEST_CLIENT_SECRET>") do
    ENV['INSTAGRAM_API_TEST_CLIENT_SECRET']
  end
  c.filter_sensitive_data("<INSTAGRAM_API_TEST_CALLBACK_URL>") do
    ENV['INSTAGRAM_API_TEST_CALLBACK_URL']
  end
  c.filter_sensitive_data("<INSTAGRAM_API_TEST_ACCESS_TOKEN>") do
    ENV['INSTAGRAM_API_TEST_ACCESS_TOKEN']
  end
  c.cassette_library_dir = 'spec/cassettes'
  c.default_cassette_options = {
    :serialize_with             => :json,
    :preserve_exact_body_bytes  => true,
    :decode_compressed_response => true
  }
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

def test_client_id
  ENV['INSTAGRAM_API_TEST_CLIENT_ID']
end

def test_client_secret
  ENV['INSTAGRAM_API_TEST_CLIENT_SECRET']
end

def test_callback_url
  ENV['INSTAGRAM_API_TEST_CALLBACK_URL']
end

def test_access_token
  ENV['INSTAGRAM_API_TEST_ACCESS_TOKEN']
end

def test_client
  Instagram::Client.new(
    client_id: test_client_id,
    client_secret: test_client_secret,
    callback_url: test_callback_url
  )
end

def test_auth_client
  Instagram.client(access_token: test_access_token)
end