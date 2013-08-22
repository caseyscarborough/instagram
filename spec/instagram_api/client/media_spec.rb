require 'spec_helper'

describe Instagram::Client::Media do

  describe '.media', :vcr do
    it 'returns media information' do
      response = test_auth_client.media(5211)
      response.should be_instance_of Hash
    end
  end

  describe '.media_search', :vcr do
    it 'returns search results' do
      response = test_auth_client.media_search(lat: '48.858844', lng: '2.294351')
      response.should be_instance_of Array
    end
  end

  describe '.popular_media', :vcr do
    it 'returns popular media' do
      test_auth_client.popular_media.should be_instance_of Array
    end
  end
end