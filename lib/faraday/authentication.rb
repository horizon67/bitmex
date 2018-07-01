require 'faraday'

module FaradayMiddleware
  class Authentication < Faraday::Middleware

    def initialize(app, key, secret)
      super(app)
      @key = key
      @secret = secret
    end

    def call(env)
      return @app.call(env) if @key.nil? || @secret.nil?

      timestamp = 10.minutes.since.to_i.to_s
      method = env[:method].to_s.upcase
      path = env[:url].path + (env[:url].query ? '?' + env[:url].query : '')
      body = env[:body] || ''
      signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), @secret, method + path + timestamp + body)
      env[:request_headers]['api-expires'] = timestamp
      env[:request_headers]['api-key'] = @key if @key
      env[:request_headers]['api-signature'] = signature
      @app.call env
    end
  end
end
