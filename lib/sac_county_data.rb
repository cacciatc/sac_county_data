require "sac_county_data/version"

require_relative 'sac_county_data/outstanding_checks'

module SacCountyData
	API_URL = "http://saccounty.cloudapi.junar.com/api/v2/datastreams"
	module Configuration
		attr_accessor :api_key
	
		def configure
			yield self
		end
	end
	extend Configuration
end