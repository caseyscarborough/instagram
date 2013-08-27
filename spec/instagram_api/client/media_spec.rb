require 'spec_helper'

describe Instagram::Client::Media do

  describe '.media', :vcr do
    it 'returns media information' do
      response = test_auth_client.media(5211)
      response.data.should be_instance_of Hashie::Mash
    end
  end

  describe '.media_search', :vcr do
    it 'returns search results for lat and long' do
      response = test_auth_client.media_search(:lat => '48.858844', :lng => '2.294351')
      response.data.should be_instance_of Array
    end

    it 'returns search results for distance' do
      response = test_auth_client.media_search(:lat => '48.858844', :lng => '2.294351', :distance => 2000)
      response.data.should be_instance_of Array
    end

    it 'returns search results for timestamps' do
      response = test_auth_client.media_search(:lat => '48.858844', :lng => '2.294351', :min_timestamp => 1357020000, :max_timestamp => 1375246800)
      response.data.should be_instance_of Array
    end
  end

  describe '.popular_media', :vcr do
    it 'returns popular media' do
      test_auth_client.popular_media.data.should be_instance_of Array
    end
  end
end