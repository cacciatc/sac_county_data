require './test/test_helper'

describe 'SacCountyData::CountyContracts' do
  before do
    SacCountyData.configure do |config|
      config.api_key = ''
    end
  end

  it 'should exist for sure' do
    assert SacCountyData::CountyContracts
  end

  it 'should return all county contracts' do
    VCR.use_cassette 'county_contracts' do
      checks = SacCountyData::CountyContracts.all

      assert checks.is_a? Array
      assert checks.length == 4602
    end
  end
end
