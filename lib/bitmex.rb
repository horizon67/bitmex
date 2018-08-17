require 'bitmex/version'
require 'bitmex/http'
require 'bitmex/configuration'

module Bitmex
  extend Configuration

  def http_public_client
    Bitmex::HTTP::Public::Client.new
  end

  def http_private_client(key, secret)
    Bitmex::HTTP::Private::Client.new(key, secret)
  end

  module_function :http_public_client, :http_private_client
end
