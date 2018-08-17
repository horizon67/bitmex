# Bitmex

A Ruby wrapper for the [Bitmex API v1](https://www.bitmex.com/api/explorer/)

## Installation

```sh
gem install bitmex
```

## Usage

See https://www.bitmex.com/api/explorer/ for details.

### HTTP API

#### Example

```ruby
# configure
Bitmex.configure do |config|
  config.adapter = Faraday.default_adapter # default: Faraday.default_adapter
  config.url = 'https://www.bitmex.com' # default: https://www.bitmex.com
  config.user_agent = 'Bitmex Ruby Gem' # default: 'Bitmex Ruby Gem [Gem Version]'
  config.loud_logger = true # default false
end

# public API
public_client = Bitmex.http_public_client
p public_client.instrument # will print instrument

# private API
private_client = Bitmex.http_private_client('YOUR_API_KEY', 'YOUR_API_SECRET')
private_client.create_order("XBTUSD", 100, {price: 6700, execInst: "ParticipateDoNotInitiate", ordType: 'Limit', side: 'Sell'})
 # you can order

p private_client.position # will print your positions
p private_client.user_wallet # will print your wallet

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/horizon67/bitmex. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

