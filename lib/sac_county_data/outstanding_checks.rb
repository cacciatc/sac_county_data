require 'faraday'
require 'json'
require 'ostruct'

module SacCountyData
  class OutstandingChecks
    RESOURCE_URL = 'OUTST-CHECK-FROM-COUNT-OF/data.json'.freeze
    def self.all
      objs = []

      response = Faraday.get("#{API_URL}/#{RESOURCE_URL}/?auth_key=#{SacCountyData.api_key}")
      a = JSON.parse(response.body)['result']['fArray']
      a[4..-1].each_slice(4) do |s|
        obj = {}
        obj[:date]   = s[0]['fStr']
        obj[:number] = s[1]['fStr']
        obj[:amount] = s[2]['fStr']
        obj[:name]   = s[3]['fStr']

        objs.push OpenStruct.new obj
      end

      objs
    end
  end
end
