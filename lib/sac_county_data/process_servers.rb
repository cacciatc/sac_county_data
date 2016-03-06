require 'faraday'
require 'json'
require 'ostruct'

module SacCountyData
  class ProcessServers
    RESOURCE_URL = 'PROCE-SERVE-LISTI/data.json'.freeze
    def self.all
      objs = []

      response = Faraday.get("#{API_URL}/#{RESOURCE_URL}/?auth_key=#{SacCountyData.api_key}")
      a = JSON.parse(response.body)['result']['fArray']
      a[6..-1].each_slice(6) do |s|
        obj = {}
        obj[:reg_number]      = s[0]['fStr']
        obj[:type]            = s[1]['fStr']
        obj[:registrant_name] = s[2]['fStr']
        obj[:dba]             = s[3]['fStr']
        obj[:expires_at]      = s[4]['fStr']
        obj[:phone]           = s[5]['fStr']

        objs.push OpenStruct.new obj
      end

      objs
    end
  end
end
