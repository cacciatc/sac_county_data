require 'faraday'
require 'json'
require 'ostruct'

module SacCountyData
  class RestaurantInspections 
    RESOURCE_URL = 'RFI/data.json'.freeze
    def self.all
      objs = []

      response = Faraday.get("#{API_URL}/#{RESOURCE_URL}/?auth_key=#{SacCountyData.api_key}")
     	require 'pry';binding.pry 
			a = JSON.parse(response.body)['result']['fArray']
      a[12..-1].each_slice(12) do |s|
        obj = {}
        obj[:facility_id]     = s[0]['fStr']
        obj[:facility_name]   = s[1]['fStr']
        obj[:address]         = s[2]['fStr']
        obj[:city]            = s[3]['fStr']
        obj[:zip]             = s[4]['fStr']
				obj[:phone]				    = s[5]['fStr']
				obj[:report_id]		    = s[6]['fStr']
				obj[:result]				  = s[7]['fStr']
				obj[:last_inspection]	= s[8]['fStr']
				obj[:inspection_type] = s[9]['fStr']
				obj[:coordinates]     = s[10]['fStr']
				obj[:last_updated]    = s[11]['fStr']
        objs.push OpenStruct.new obj
      end

      objs
    end
  end
end
