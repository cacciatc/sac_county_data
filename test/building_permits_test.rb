require './test/test_helper'

describe 'SacCountyData::BuildingPermits' do
  before do
    SacCountyData.configure do |config|
      config.api_key = ''
    end
  end

  it 'should exist for sure' do
    assert SacCountyData::BuildingPermits
  end

  it 'should return all building permits' do
    VCR.use_cassette 'building_permits' do
      permits = SacCountyData::BuildingPermits.all

      assert permits.is_a? Array
      assert permits.length == 2474
    end
  end
end
