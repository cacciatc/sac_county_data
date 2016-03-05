require 'faraday'
require 'json'
require 'ostruct'

module SacCountyData
	class OutstandingChecks
		RESOURCE_URL = "OUTST-CHECK-FROM-COUNT-OF/data.json"
		def self.all
			objs = []

			response = Faraday.get("#{API_URL}/#{RESOURCE_URL}/?auth_key=#{SacCountyData.api_key}")
			a = JSON.parse(response.body)["result"]["fArray"]
			a.each_slice(8) do |s|
				obj = {}
				obj[:date]   = s[4]["fStr"]
				obj[:number] = s[5]["fStr"]
				obj[:amount] = s[6]["fStr"]
				obj[:name]   = s[7]["fStr"]
				
				objs.push OpenStruct.new obj
			end

			objs
		end
	end
end
