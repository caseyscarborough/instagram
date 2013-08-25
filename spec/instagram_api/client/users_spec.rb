require 'spec_helper'

describe Instagram::Client::Users do

  describe '.user' do
    describe 'with id', :vcr do
      it 'returns a user' do
        user = test_auth_client.user(16500486)
        user.data.should be_instance_of Hashie::Mash
        user.data.username.should == 'caseyscarborough'
      end
    end

    describe 'with username', :vcr do
      it 'returns a user' do
        user = test_auth_client.user('caseyscarborough')
        user.data.should be_instance_of Hashie::Mash
        user.data.username.should == 'caseyscarborough'
      end
    end

    describe 'with no parameter', :vcr do
      it 'returns a user' do
        user = test_auth_client.user
        user.data.should be_instance_of Hashie::Mash
        user.data.username.should == 'caseyscarborough'
      end
    end
  end

  describe '.search', :vcr do
    it 'returns search results' do
      results = test_auth_client.search('caseyscarborough')
      results.data.should be_instance_of Array
      results.data[0].id.should == "16500486"
    end
  end

  describe '.feed', :vcr do
    it 'returns an array of info' do
      results = test_auth_client.feed
      results.data.should be_instance_of Array
    end
  end

  describe '.recent' do
    describe 'with id', :vcr do
      it 'returns an array of info' do
        results = test_auth_client.recent(16500486)
        results.data.should be_instance_of Array
      end
    end

    describe 'with no id', :vcr do
      it 'returns the authenticated users data' do
        results = test_auth_client.recent
        results.data.should be_instance_of Array
      end
    end
  end

  describe '.liked', :vcr do
    it 'returns liked data' do
      results = test_auth_client.liked
      results.data.should be_instance_of Array
    end
  end

end