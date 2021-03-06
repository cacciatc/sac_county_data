require 'sac_county_data/version'

require_relative 'sac_county_data/outstanding_checks'
require_relative 'sac_county_data/restaurant_inspections'
require_relative 'sac_county_data/building_permits'
require_relative 'sac_county_data/process_servers'
require_relative 'sac_county_data/county_contracts'

module SacCountyData
  API_URL = 'http://saccounty.cloudapi.junar.com/api/v2/datastreams'.freeze
  module Configuration
    attr_accessor :api_key

    def configure
      yield self
    end
  end
  extend Configuration
end
