require './test/test_helper'

describe 'SacCountyData::ProcessServers' do
  before do
    SacCountyData.configure do |config|
      config.api_key = ''
    end
  end

  it 'should exist for sure' do
    assert SacCountyData::ProcessServers
  end

  it 'should return all process servers' do
		VCR.use_cassette 'process_servers' do
	    servers = SacCountyData::ProcessServers.all
	    
			assert servers.is_a? Array
			assert servers.length == 208
		end
  end
end
