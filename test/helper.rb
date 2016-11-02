require 'bundler/setup'
require 'minitest/autorun'
require 'mocha/setup'
require 'omniauth/strategies/miisy'

OmniAuth.config.test_mode = true

class StrategyTestCase < Minitest::Test

  def setup
    @request = stub('Request')
    @request.stubs(:params).returns({})
    @request.stubs(:cookies).returns({})
    @request.stubs(:env).returns({})
    @request.stubs(:scheme).returns({})
    @request.stubs(:ssl?).returns(false)

    @client_id = '123'
    @client_secret = 's3cr3t'
  end

  def strategy
    @strategy ||= begin
      OmniAuth::Strategies::Miisy.new(nil, @client_id, @client_secret).tap do |strategy|
        strategy.stubs(:request).returns(@request)
      end
    end
  end
end
