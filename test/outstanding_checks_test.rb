require './test/test_helper'

describe 'SacCountyData::OutstandingChecks' do
  before do
    SacCountyData.configure do |config|
      config.api_key = ''
    end
  end

  it 'should exist for sure' do
    assert SacCountyData::OutstandingChecks
  end

  it 'should return all outstanding checks' do
		VCR.use_cassette 'outstanding_checks' do
	    checks = SacCountyData::OutstandingChecks.all
	    
			assert checks.is_a? Array
			assert checks.length == 7017
		end
  end
end
