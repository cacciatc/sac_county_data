# SacCountyData

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

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sac_county_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
