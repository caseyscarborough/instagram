require 'spec_helper'

describe Instagram::Client do

  describe 'default attributes' do
    it 'must include httparty' do
      Instagram::Client.should include(HTTParty)
    end

    it 'must have base URI set to Instagram API endpoint' do
      Instagram::Client.base_uri.should eq('https://api.instagram.com/v1')
    end
  end

  describe '.initialize' do
    subject { test_client }
    its(:client_id) { should == test_client_id }
    its(:client_secret) { should == test_client_secret }
    its(:callback_url) { should == test_callback_url }
  end

  describe '.authorize_url' do
    it 'returns the correct authorization url' do
      test_client.authorize_url.should == "#{Instagram::Default::AUTH_URL}?client_id=#{test_client.client_id}&redirect_uri=#{test_client.callback_url}&response_type=code"
    end
  end

end