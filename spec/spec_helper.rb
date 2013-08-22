require 'instagram_api'
require 'webmock/rspec'
require 'vcr'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include WebMock::API

  CONFIG = YAML.load(File.read(File.expand_path('../config.yml', __FILE__)))
end

VCR.configure do |c|
  c.configure_rspec_metadata!
  c.filter_sensitive_data("<test_client_id>") do
    CONFIG['test_client_id']
  end
  c.filter_sensitive_data("<test_client_secret>") do
    CONFIG['test_client_secret']
  end
  c.filter_sensitive_data("<test_callback_url>") do
    CONFIG['test_callback_url']
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
  CONFIG['test_client_id']
end

def test_client_secret
  CONFIG['test_client_secret']
end

def test_callback_url
  CONFIG['test_callback_url']
end

def test_client
  Instagram::Client.new(
    client_id: test_client_id,
    client_secret: test_client_secret,
    callback_url: test_callback_url
  )
end