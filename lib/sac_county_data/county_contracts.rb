require 'faraday'
require 'json'
require 'ostruct'

module SacCountyData
  class CountyContracts
    RESOURCE_URL = 'COUNT-CONTR/data.json'.freeze
    def self.all
      objs = []

      response = Faraday.get("#{API_URL}/#{RESOURCE_URL}/?auth_key=#{SacCountyData.api_key}")
      a = JSON.parse(response.body)['result']['fArray']
      a[8..-1].each_slice(8) do |s|
        obj = {}
        obj[:contract_num]         = s[0]['fStr']
        obj[:item_num] 		         = s[1]['fStr']
        obj[:contract_type]        = s[2]['fStr']
        obj[:vendor_name]          = s[3]['fStr']
        obj[:contract_value]       = s[4]['fStr']
        obj[:material_description] = s[5]['fStr']
        obj[:start_at]             = s[6]['fStr']
        obj[:end_at]               = s[7]['fStr']

        objs.push OpenStruct.new obj
      end

      objs
    end
  end
end
