# SacCountyData

[![Gem Version](https://badge.fury.io/rb/sac_county_data.svg)](https://badge.fury.io/rb/sac_county_data)

A Ruby interface for the Sacramento County Open Data portal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sac_county_data'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sac_county_data

## Usage

After installation you will also need to request an API key from the [Sacramento County site](http://data.saccounty.net/developers/).

```ruby
require 'sac_county_data'

SacCountyData.configure do |config|
	config.api_key = '<YOUR API KEY>'
end

# returns an array of outstanding checks
SacCountyData::OutstandingChecks.all

# returns an array of restaurant inspections
SacCountyData::RestaurantInspections.all

# returns an array of building permits
SacCountyData::BuildingPermits.all

# returns an array of county contracts
SacCountyData::CountyContracts.all

# returns an array of process servers
SacCountyData::ProcessServers.all
```

## Notes
As far as I can tell the API does not provide any pagination or query parameters. Also some resources such as building permits are only for 2015. This is because the Sac County currently has those broken up as different resources and other weirdness...

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sac_county_data/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Write tests
4. Run rubocop -a
5. Commit your changes (git commit -am 'Add some feature')
6. Push to the branch (git push origin my-new-feature)
7. Create a new Pull Request
