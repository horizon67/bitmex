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
public_client = Bitmex.http_public_client
p public_client.instrument # will print instrument

private_client = Bitmex.http_private_client('YOUR_API_KEY', 'YOUR_API_SECRET')
p private_client.position # will print your positions
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/horizon67/bitmex. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

