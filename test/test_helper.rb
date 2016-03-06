require './lib/sac_county_data'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |config|
	config.cassette_library_dir = 'test/fixtures/vcr_cassettes'
	config.hook_into :webmock
end
