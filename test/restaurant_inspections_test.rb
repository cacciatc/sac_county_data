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
  
	it 'should return all restaurant inspections' do
		VCR.use_cassette 'restaurant_inspections' do
    	inspections = SacCountyData::RestaurantInspections.all
  
			assert inspections.is_a? Array
			assert inspections.length == 5577, inspections.length 
		end
	end
end
