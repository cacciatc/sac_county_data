require './test/test_helper'

describe SacCountyData::RestaurantInspections do
	before do
    SacCountyData.configure do |config|
      config.api_key = ''
    end
  end

  it 'should exist for sure' do
    assert SacCountyData::RestaurantInspections
  end
end
