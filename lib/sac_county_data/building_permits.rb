require 'faraday'
require 'json'
require 'ostruct'

module SacCountyData
  class BuildingPermits 
    RESOURCE_URL = 'ALL-PERMI-ISSUE-FOR-2015/data.json'.freeze
    def self.all
      objs = []

      response = Faraday.get("#{API_URL}/#{RESOURCE_URL}/?auth_key=#{SacCountyData.api_key}")
      a = JSON.parse(response.body)['result']['fArray']
      a[19..-1].each_slice(19) do |s|
        obj = {}
        obj[:type]                = s[0]['fStr']
        obj[:subtype]             = s[1]['fStr']
        obj[:application]         = s[2]['fStr']
        obj[:opened_at]           = s[3]['fStr']
        obj[:status_at]           = s[4]['fStr']
        obj[:parcel_number]       = s[5]['fStr']
        obj[:address]             = s[6]['fStr']
        obj[:project_name]        = s[7]['fStr']
        obj[:inspection_district] = s[8]['fStr']
        obj[:house_count]         = s[9]['fStr']
        obj[:square_ft]           = s[10]['fStr']
        obj[:valuation]           = s[11]['fStr']
        obj[:activity_code]       = s[12]['fStr']
        obj[:description]         = s[13]['fStr']
        obj[:contractor]          = s[14]['fStr']
        obj[:district]            = s[15]['fStr']
        obj[:comm_plan_area]      = s[16]['fStr']
        obj[:intake_location]     = s[17]['fStr']
        obj[:work_description]    = s[18]['fStr']

        objs.push OpenStruct.new obj
      end

      objs
    end
  end
end
